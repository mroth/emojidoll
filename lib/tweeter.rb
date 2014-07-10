#!/usr/bin/env ruby

require 'twitter'
require 'dotenv'
Dotenv.load

module Tweeter

  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY']
    config.consumer_secret     = ENV['CONSUMER_SECRET']
    config.access_token        = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_SECRET']
  end

end
