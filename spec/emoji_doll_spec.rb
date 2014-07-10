require './lib/emoji_doll'

describe EmojiDoll do

  it "should generate a random doll when initialized" do
    d1 = EmojiDoll.new.render
    d2 = EmojiDoll.new.render
    expect(d1).not_to eq(d2)
  end
  it "should create the same doll when init'd with same seed" do
    d1 = EmojiDoll.new(123456).render
    d2 = EmojiDoll.new(123456).render
    expect(d1).to eq(d2)
  end
  it "should always render the same doll the same" do
    doll = EmojiDoll.new
    render1 = doll.render
    render2 = doll.render
    render3 = doll.render
    expect(render1).to eq(render2)
    expect(render1).to eq(render3)
  end

end
