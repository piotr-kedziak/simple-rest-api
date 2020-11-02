# frozen_string_literal: true

require 'sinatra/base'

# http://www.omdbapi.com
class FakeOMDB < Sinatra::Base
  get '/' do
    json_response 200, 'movie.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open("#{File.dirname(__FILE__)}/api/omdb/#{file_name}", 'rb').read
  end
end
