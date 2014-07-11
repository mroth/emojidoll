#!/usr/bin/env ruby
require './lib/tweeter'
require './lib/emoji_doll'

$stdout.sync = true

# use the stream client to watch userstream
Tweeter::STREAM_CLIENT.user do |object|
  case object
  when Twitter::Tweet
    puts "*** saw a tweet at #{object.url.to_s}"
    if Tweeter.candidate?(object)
      puts "  - it's a candidate! omg i'm going to reply!!!"
      r=Tweeter.reply_with_msg!( object, EmojiDoll.new(object.user.id).render() )
      puts "  -> #{r.url.to_s}"
    else
      puts "  - not a candidate, ignoring."
    end
  when Twitter::DirectMessage
    puts "OMG A DIRECT MESSAGE! (how?)"
  when Twitter::Streaming::StallWarning
    warn "Stall Warning - Falling behind!"
  end
end
