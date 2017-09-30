# Create a class called BankAccount.
class BankAccount
  # Add a class variable called @@interest_rate that is a float representing the interest rate for all the accounts in the bank. This is a class variable because it is the same value for all accounts.
  # Add another class variable called @@accounts that starts as an empty array. This will eventually store the list of all bank accounts in the bank.
  @@interest_rate = 2.25/100
  @@accounts = []



  def self.create
    @@accounts << BankAccount.new #calls BankAccount.new and adds the new object to @@accounts so that we can find it again in the future. --- basically the idea is : the bank can store the accounts it has into a list(array) and then check back on how many accounts they hold vs the instance of account which can only see that particular customer's account
    return @@accounts.last ### this is so we return the newest accoutn that is being created with this class method. the bank can check the total # of accounts any time by accessing @@accounts array
  end


  #Add a class method called total_funds that returns the sum of all balances across all accounts in @@accounts.
  #This needs to be a class method because it does not pertain to any single, specific account.
  def self.total_funds
    total = 0
    @@accounts.each do |account|
      total += account.balance #we can call an instance function on the array entry because it is an instance that was stored, even if it is in the class method.
    end
    return total # always return function value outside the loop
  end

  def self.interest_time
    @@accounts.each do |account| #iterate through array which is |account|
    interest = account.balance * @@interest_rate #local variable that only exists in this method is the total interest rate per entry in array
    account.deposit(interest) #we need to add that interest to the accounts by calling our deposit
    end
  end


  #Add an initialize instance method that sets @balance to zero. You should also add reader and writer methods for balance to your class. Balance is stored in an instance variable because the value needs to be different from account to account.

  def initialize
    @balance = 0
  end

  #READER
# Add an initialize instance method that sets @balance to zero. You should also add reader and writer methods for balance to your class. Balance is stored in an instance variable because the value needs to be different from account to account

  def balance
    @balance
  end

  #WRITER

  def first_deposit=(balance)
    @balance += balance
  end
  #
  # Add an instance method called deposit that accepts a number as an argument and adds that amount to the account's balance.
  # This needs to be an instance method because it pertains to a single, specific account.

#INSTANCE METHODS
  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount

  end

end


my_account = BankAccount.create
your_account = BankAccount.create
puts '-'*33
puts my_account.balance # 0
puts '-'*33
puts BankAccount.total_funds # 0
puts '-'*33
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts '-'*33
puts your_account.balance # 1000
puts '-'*33
puts BankAccount.total_funds # 1200
puts '-'*33
BankAccount.interest_time
puts '-'*33
puts my_account.balance # 202.0
puts '-'*33
puts your_account.balance # 1010.0
puts '-'*33
puts BankAccount.total_funds # 1212.0
puts '-'*33
my_account.withdraw(50)
puts '-'*33
puts my_account.balance # 152.0
puts '-'*33
puts BankAccount.total_funds # 1162.0
puts '-'*33
