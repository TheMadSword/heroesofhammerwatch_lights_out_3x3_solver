# Input : array in form of binary format, from bottom-left to top-right, bottom first,
# i.e. :
# 000010100 = 20 would be :
#
# OOO
# OXO
# OOX

input_nb = ARGV.first
if input_nb.nil? || input_nb.to_s.length != 9 || input_nb.to_s.count('01') != 9
  raise ArgumentError.new("No args given following format '010101010'")
end

require_relative 'lights_out_3x3'

problem = ARGV.first.to_i(2)

p "Problem (#{problem}): "
LightsOut3x3.ascii_print(problem)

solution = LightsOut3x3.new(problem).bruteforce_solve

p "Solution (in #{LightsOut3x3.count_bits(solution)} steps): "
LightsOut3x3.ascii_print(solution)
