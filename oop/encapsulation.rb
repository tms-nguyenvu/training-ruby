class BankAccount 
  attr_reader :owner

  def initialize(owner, balance)
    @owner = owner
    @balance = balance
  end

  def deposit(amount)
    if validate_amount(amount)
      @balance += amount
    else
      puts "Amount must be greater than 0"
    end
  end

  def withdraw(amount)
    if validate_amount(amount) && @balance >= amount
      @balance -= amount
    else
      puts "Insufficient funds or amount must be greater than 0"
    end
  end
  
  def display_balance
    puts "Account balance for #{@owner}: #{@balance}$"
  end

  private
  
  def validate_amount(amount)
    amount > 0
  end
end

bank_account = BankAccount.new("John Doe", 1000)
bank_account.deposit(500)
bank_account.withdraw(200)
bank_account.display_balance
