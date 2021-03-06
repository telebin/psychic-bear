require '../test_framework'

class Adv2_a < TestFramework
  def logic(t)
    lines = t.split "\n"
    lines.reduce(0) do |acc, line|
      numbers = line.split.map(&:to_i)
      acc += numbers.max - numbers.min
    end
  end
end

class Adv2_b < TestFramework
  def logic(t)
    lines = t.split "\n"
    lines.reduce(0) do |acc, line|
      mapped = line.split.map(&:to_i)
      acc += mapped.each do |num|
        found = mapped.find { |div| div != num && num % div == 0 }
        break num / found if found
      end
    end
  end
end

File.open('inputs/day2.txt') { |f| INPUT = f.read.chomp }

adva = Adv2_a.new({ '5 1 9 5
7 5 3
2 4 6 8
' => 18 })
# adva.test
# puts adva.logic INPUT

advb = Adv2_b.new({ '5 9 2 8
9 4 7 3
3 8 6 5
' => 9 })
# advb.test
puts advb.logic INPUT
