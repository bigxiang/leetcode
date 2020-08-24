#
# @lc app=leetcode id=8 lang=ruby
#
# [8] String to Integer (atoi)
#

# @lc code=start
# @param {String} str
# @return {Integer}
def my_atoi(str)
  auto = Automation.new
  str.chars.each do |c|
    auto.process(c)
    break if auto.state == 'end'
  end
  auto.num
end

class Automation
  attr_accessor :state, :states, :sign, :num, :char, :min, :max

  def initialize
    @min = - 2 ** 31
    @max = 2 ** 31 - 1
    @state = 'start'
    @sign = 1
    @num = 0
    @states = {
      # states:   0        1         2      3
      'start' => ['space', 'signed', 'num', 'end'],
      'space' => ['space', 'signed', 'num', 'end'],
      'signed' => ['end', 'end', 'num', 'end'],
      'num' => ['end', 'end', 'num', 'end'],
    }
  end

  def process(char)
    self.char = char
    process_state

    case state
    when 'signed'
      self.sign = -1 if char == '-'
    when 'num'
      self.num = sign == 1 ? [max, num * 10 + char.to_i].min : [min, num * 10 - char.to_i].max
    end
  end

  private

  def process_state
    case char
    when ' '
      self.state = states[state][0]
    when '+', '-'
      self.state = states[state][1]
    when ('0'..'9')
      self.state = states[state][2]
    else
      self.state = states[state][3]
    end
  end
end
# @lc code=end

puts my_atoi('42')
puts my_atoi('     -42')
puts my_atoi('     +4223 002')
puts my_atoi('     +4223-002')
puts my_atoi('4193 with words')
puts my_atoi('words and 987')
puts my_atoi('-91283472332')

