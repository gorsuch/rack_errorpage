require 'time'
require 'rack/utils'
require 'rack/mime'
 
module Rack
  # Catches all exceptions, forgets about them, and displays the given html file wth a status of 500 
 
  class ErrorPage
    attr_reader :filename
 
    def initialize(app,filename)
      @app = app
      @filename = filename
    end
 
    def call(env)
      status, headers, body =
        begin
          @app.call(env)
        rescue => boom
          render_page
        end
      render_page if env['rack.exception']
      [status, headers, body]
    end
  
  private

    def render_page
      body = [::File.read(@filename)]
      size = Utils.bytesize(body.first)
      
      [500, {
        "Last-Modified"  => ::File.mtime(@filename).httpdate,
        "Content-Type"   => Mime.mime_type(::File.extname(@filename), 'text/plain'),
        "Content-Length" => size.to_s
      }, body]
      
    end    
  end
end