#!/usr/bin/env ruby

require './lib/tweeter'
require './lib/emoji_doll'

puts EmojiDoll.stats()
puts "----------------"
# seed = 33837
doll = EmojiDoll.new()
puts "Random emojidoll for seed #{doll.seed}"
puts doll.render()

tweet = "Random emojidoll test - key #{doll.seed}\n" +
        "#{doll.render()}" +
        "To get your own..."

post = Tweeter::CLIENT.update tweet
puts "posted as https://twitter.com/#{post.user.screen_name}/status/#{post.id.to_s}"
