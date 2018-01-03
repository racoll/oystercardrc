class Oystercard

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    @balance += amount
  end

  def max_balance
    90
  end

end
