require 'net/http'
require 'json'
require 'pry'
require 'robustly'

BROWSE_URL = "/files/browse?path="
DOWNLOAD_URL = "/files/download?path="
FILE_LIST = "downloads.list"

@mesos_host = ARGV.shift
@seed_path = ARGV.shift
@url_queue = []
@files = []

def relative_path(path)
  path.match(/^#{@seed_path}(.+)$/)[1]
end

def queue(path)
  url = @mesos_host + BROWSE_URL + path
  @url_queue << url
end

def download(path)
  url = @mesos_host + DOWNLOAD_URL + path
  uri = URI(url)
  Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Get.new uri

    http.request request do |response|
      open relative_path(path), 'w' do |io|
        response.read_body do |chunk|
          io.write chunk
        end
      end
    end
  end
end

def crawl_and_queue_files(url)
  uri = URI(url)
  res = Net::HTTP.get(uri)
  files = JSON.parse(res)
  files.each do |file|
    warn relative_path(file["path"])
    if file["mode"] =~ /^d/
      Dir.mkdir(relative_path(file["path"]))
      queue(file["path"])
    else
      @download_list << file["path"] << "\n"
    end
  end
end

queue(@seed_path)

while !@url_queue.empty? do
  crawl_and_queue_files(@url_queue.shift)
end

Robustly.new(FILE_LIST, "finished.list", threads: 8, backtrace: true, update_interval: 5).each_line do |path|
  warn relative_path(path)
  download(path)
end
