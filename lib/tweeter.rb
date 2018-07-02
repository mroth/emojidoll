#!/usr/bin/env ruby

require 'twitter'

module Tweeter

  # set up a stream client
  STREAM_CLIENT = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY']
    config.consumer_secret     = ENV['CONSUMER_SECRET']
    config.access_token        = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_SECRET']
  end

  # set up a REST client for replying
  REST_CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY']
    config.consumer_secret     = ENV['CONSUMER_SECRET']
    config.access_token        = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_SECRET']
  end

  def self.candidate?(tweet)
    return false if tweet.retweet?   # no retweets
    return false unless tweet.reply? # should be a 'reply' (starts w/ mention)
    return true if tweet.full_text.downcase.start_with? "@emojidoll me"
    false
  end

  def self.reply_with_msg!(tweet, msg)
    fmsg = formatted_msg(tweet.user.screen_name, msg)
    REST_CLIENT.update(fmsg, :in_reply_to_status_id => tweet.id)
  end

  def self.formatted_msg(screen_name, msg)
    msg = "@#{screen_name} your unique emojidoll:\n" +
          "#{msg}"
    msg
  end

end
