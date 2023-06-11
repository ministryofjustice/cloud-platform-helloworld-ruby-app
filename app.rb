#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    '<h1>Hello, Ky, from GitHub Actions!</h1>'
  end
end