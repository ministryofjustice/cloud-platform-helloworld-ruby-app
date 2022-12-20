#!/usr/bin/env ruby
require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    '<h1>Hello, World!</h1>'
  end
end