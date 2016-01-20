#!/usr/bin/env ruby
# encoding: UTF-8

# bundler includes
require 'rubygems'
require 'bundler'

Bundler.require

# APP per se
require './app'

run Pumatra.new # run a new pumatra instance