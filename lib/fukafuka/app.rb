require 'sinatra/base'
require 'sinatra/reloader'
require 'prime'

module Fukafuka
  def self.app
    App.rack
  end

  class App < Sinatra::Base
    configure :development do
      register Sinatra::Reloader
    end

    set :environment, ENV['RACK_ENV'] == 'deployment' ? :production : ENV['RACK_ENV'].to_sym

    def self.rack
      app = lambda { |env|
        App.call(env)
      }
    end

    get '/prime' do
      num = Integer(params[:num])
      {
        'status' => 'ok',
        'result' => Prime.prime_division(num),
      }.to_json
    end

    get '/hexdigest' do
      str = params.fetch(:str)
      iteration = Integer(params.fetch(:iteration))

      hexdigest = nil
      iteration.times do
        hexdigest = OpenSSL::Digest::SHA256.hexdigest(str)
      end

      {
        'status' => 'ok',
        'result' => hexdigest,
      }.to_json
    end
  end
end
