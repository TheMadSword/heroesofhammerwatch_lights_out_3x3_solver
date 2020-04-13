require_relative '../lights_out_3x3'

describe "LightsOut3x3" do
  it "should ensure to modifynothing when giving no position" do
    expect(LightsOut3x3.new(0).xor_transfo(0)).to be_zero
  end
  it "should ensure to modify self and neighbor when giving a position" do
    expect(LightsOut3x3.new(0).xor_transfo(1 << 0)).to eql(1 << 0 | 1 << 1 | 1 << 3)
    expect(LightsOut3x3.new(0).xor_transfo(1 << 1)).to eql(1 << 0 | 1 << 1 | 1 << 2 | 1 << 4)
    expect(LightsOut3x3.new(0).xor_transfo(1 << 2)).to eql(1 << 1 | 1 << 2 | 1 << 5)
  end
  it "should ensure to modify self and neighbor correctly when giving a set of positions" do
    expect(LightsOut3x3.new(0).xor_transfo(1 << 0 | 1 << 1)).to eql(1<<2 | 1<<3 | 1<<4)
    expect(LightsOut3x3.new(0).xor_transfo(1 << 0 | 1 << 2)).to eql(1<<0|1<<2|1<<3|1<<5)
    expect(LightsOut3x3.new(0).xor_transfo(1 << 1 | 1 << 4)).to eql(1<<0|1<<2|1<<3|1<<5|1<<7)
  end
  it "should give center/middle point if we have every corner" do
    expect(LightsOut3x3.new(1 << 0 | 1 << 2 | 1 << 6 | 1 << 8).bruteforce_solve).to eql(1 << 4)
  end
end
