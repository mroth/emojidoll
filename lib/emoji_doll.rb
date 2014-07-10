#!/usr/bin/env ruby

class EmojiDoll
  attr_reader :seed

  HEADS = "🐶🐱🐭🐹🐰🐯🐸🐨🐻🐷🐮🐵🐼👹💀👽💩🎃🎅🌞🌝😺😸😻😽😼🙀😿😹😾👲👳👮👷💂👶👦👧👨👩👴👵👱👼👸".split("")
  HATS = "🎩👑👒🎓 ".split("")
  BODIES = "👕👚👗👙👘🎽".split("")
  SHOES = "👟👞👡👠👢".split("")
  EITHER_ARMS = "📱🍷🍸👜💼".split("")
  LEFT_ARMS = EITHER_ARMS + "🎈🎥📢📣🔫🚬🎤🎷🎺☕️🎣🍹🍭👌👋✊✌️👊✋👈💪☝️".split("")
  RIGHT_ARMS = EITHER_ARMS + "☔️📞🎉🔪💉🎻🎸🌂👍👎👉".split("")

  def initialize(seed = Random.new_seed)
    @seed = seed
    seedme()
  end

  def render
    "    #{@h} \n    #{@f} \n#{@l}#{@b}#{@r}\n  #{@s}#{@s}\n"
  end

  def self.stats
    {
      heads: HEADS.size,
      hats: HATS.size,
      bodies: BODIES.size,
      shoes: SHOES.size,
      left_arms: LEFT_ARMS.size,
      right_arms: RIGHT_ARMS.size,
      combinations: HEADS.size * HATS.size * BODIES.size * SHOES.size * LEFT_ARMS.size * RIGHT_ARMS.size
    }
  end

  private

  def seedme
    @rng = Random.new(seed)
    @f = HEADS.sample(random: @rng)
    @h = HATS.sample(random: @rng)
    @b = BODIES.sample(random: @rng)
    @l = LEFT_ARMS.sample(random: @rng)
    @r = RIGHT_ARMS.sample(random: @rng)
    @s = SHOES.sample(random: @rng)
  end

end
