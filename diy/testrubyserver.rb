#!/usr/bin/env ruby
require 'webrick'
include WEBrick

config = {}
config.update(:Port => 8080)
config.update(:BindAddress => ARGV[0])
config.update(:DocumentRoot => ARGV[1])
config.update(:MimeTypes => {'rhtml' => 'text/html', 'css' => 'text/css'})
server = HTTPServer.new(config)
['INT', 'TERM'].each {|signal|
  trap(signal) {server.shutdown}
}

# server.mount_proc '/' do |req, res|
#   res.body = 'Hello, world!' + req.to_s
# end

server.start
