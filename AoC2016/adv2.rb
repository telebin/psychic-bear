require '../test_framework'

class Adv2_a < TestFramework
  PINPAD = %w(123 456 789)

  def logic(t)
    pointer = [1, 1]
    pin = ''
    t.each do |line|
      line.chars.each do |dir|
        case dir
          when 'U'
            pointer[1] = [pointer[1] - 1, 0].max
          when 'D'
            pointer[1] = [pointer[1] + 1, 2].min
          when 'L'
            pointer[0] = [pointer[0] - 1, 0].max
          when 'R'
            pointer[0] = [pointer[0] + 1, 2].min
        end
      end
      pin << PINPAD[pointer[1]][pointer[0]]
    end
    pin
  end
end

class Adv2_b < TestFramework
  PINPAD2 = %w(--1-- -234- 56789 -ABC- --D--)
  LIMITS = [[2, 2], [1, 3], [0, 4], [1, 3], [2, 2]]

  def logic(t)
    pointer = [0, 2]
    pin = ''
    t.each do |line|
      line.chars.each do |dir|
        case dir
          when 'U'
            pointer[1] = [pointer[1] - 1, LIMITS[pointer[0]][0]].max
          when 'D'
            pointer[1] = [pointer[1] + 1, LIMITS[pointer[0]][1]].min
          when 'L'
            pointer[0] = [pointer[0] - 1, LIMITS[pointer[1]][0]].max
          when 'R'
            pointer[0] = [pointer[0] + 1, LIMITS[pointer[1]][1]].min
        end
      end
      pin << PINPAD2[pointer[1]][pointer[0]]
    end
    pin
  end
end

tests = Adv2_a.new({"ULL\nRRDDD\nLURDL\nUUUUD".split => '1985'}, 2)
testsb = Adv2_b.new({"ULL\nRRDDD\nLURDL\nUUUUD".split => '5DB3'}, 2)
tests.test
testsb.test
puts tests.run
puts testsb.run
