#!/usr/bin/env ruby

require 'bundler/setup'
require 'sinatra'
require 'ougai'

set :bind, '0.0.0.0'

logger = Ougai::Logger.new(STDERR)

get '/' do
  logger.debug({msg: 'Request', method: 'GET', path: '/'})
  '<h1>Hello, World!</h1>'
end
