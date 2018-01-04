class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 3
  MINIMUM_CHARGE = 2

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Insufficient balance to touch in" if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

  private

    def deduct(amount)
      fail "Insufficient funds. Please top up" if balance - amount < MINIMUM_BALANCE
      @balance -= amount
    end



  # def max_balance
  #   90
  # end

end
