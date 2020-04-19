require 'bundler/setup'
require 'dotenv/load'
require_relative './../lib/lpte'
require 'pry'

Dir['./spec/support/**/*.rb'].each { |f| require f }
