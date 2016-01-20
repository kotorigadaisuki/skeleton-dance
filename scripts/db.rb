#!/usr/bin/env ruby

help = "Usage: #{__FILE__} [upgrade|migrate]"

if ARGV.any? and ['migrate','upgrade'].include?ARGV.first
  require 'data_mapper'
  require 'dm-postgres-adapter'

  cf = YAML.load_file("config.yml")
  cf = cf.inject({}){|h,(k,v)| h.merge({ k.to_sym => v}) }

  url = "postgres://%{user}:%{pass}@%{host}/%{name}" % cf

  DataMapper::setup(:default, url)
  DataMapper::Logger.new(STDOUT, :debug)
  
  ## Require all files from models folder
  require_relative "../models"

  DataMapper.finalize

  case ARGV.first
  when 'migrate'
    # This will drop and migrate the database
    DataMapper.auto_migrate!
  when 'upgrade'
    # This will upgrade tables changes
    DataMapper.auto_upgrade!
  else
    puts help
  end
else
  puts help
end
