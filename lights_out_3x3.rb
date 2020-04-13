class LightsOut3x3

  POS_FX = [
    "000001011".to_i(2), # "000000001", #0, x=11
    "000010111".to_i(2), # "000000010", #1, x=21
    "000100110".to_i(2), # "000000100", #2, x=31
    "001011001".to_i(2), # "000001000", #3, x=12
    "010111010".to_i(2), # "000010000", #4, x=22
    "100110100".to_i(2), # "000100000", #5, x=32
    "011001000".to_i(2), # "001000000", #6, x=13
    "111010000".to_i(2), # "010000000", #7, x=23
    "110100000".to_i(2), # "100000000", #8, x=33
  ]

  ALL_LIGHTS = 2**9 - 1

  public

  def initialize(lights)
    @initial_lights = lights
  end

  # return int xor transformation following pressed switches as an integer
  def xor_transfo(int)
    retval = 0

    (0..8).each do |i|
      retval ^= POS_FX[i] if (int & 1 << i) > 0
    end

    retval
  end

  def bruteforce_solve
    retval = nil
    (0..2**10-1).each do |switches|
      transfo = xor_transfo(switches)
      if @initial_lights ^ transfo == ALL_LIGHTS
        retval = switches
        break
      end
    end
    p "Not found" if retval.nil?
    retval
  end

  def self.ascii_print(int)
    p "#{check_bit(int, 6)}#{check_bit(int, 7)}#{check_bit(int, 8)}"
    p "#{check_bit(int, 3)}#{check_bit(int, 4)}#{check_bit(int, 5)}"
    p "#{check_bit(int, 0)}#{check_bit(int, 1)}#{check_bit(int, 2)}"
  end

  def self.check_bit(int, bit_pos)
    (int & 1 << bit_pos) > 0 ? 1 : 0
  end

  def self.count_bits(int)
    retval = 0
    (0..8).each do |i|
      retval += 1 if (int & 1 << i) > 0
    end

    retval
  end

end
