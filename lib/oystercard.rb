class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 3

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    fail "Insufficient funds. Please top up" if balance - amount < MINIMUM_BALANCE
    @balance -= amount
  end

  # def max_balance
  #   90
  # end

end
