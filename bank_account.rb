class BankAccount
  @balance = 0
  @interest_rate = 0

  def deposit=(amount)
    @balance =+ amount
  end

end

bankaccount = BankAccount.new

puts bankaccount.deposit = 10
