#!/usr/bin/env ruby

require 'bundler/setup'
require 'sinatra'
require 'sinatra/custom_logger'
require 'semantic_logger'

set :bind, '0.0.0.0'

configure do
  register Sinatra::CustomLogger
  SemanticLogger.default_level = :info
  SemanticLogger.add_appender(io: $stderr, formatter: :json)
  SemanticLogger.add_appender(appender: :elasticsearch, url: ENV['elastichost'], index: ENV['elasticindex'])
  logger = SemanticLogger['ElasticTest']
  set :raise_errors, true
  set :logger, logger
end

get '/' do
  logger.info "GET / requested"
  '<h1>Hello, World!</h1>'
  begin
    raise StandardError, 'some error'
  rescue => ex
    logger.error(ex)
  end
end
