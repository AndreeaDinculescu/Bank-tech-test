class Bank
  def initialize()
    @balance = '%.2f' % 0
    @bank_statement = []
  end

  def bank_statement(date,credit,debit,balance)
    @date = date
    @bank_statement.push(date,credit,debit,balance)
    return header +  " #{@date} || #{@credit} || #{@debit} || #{@balance}"
  end

  def printed_statement(bank_statement)
    @bank_statement = bank_statement
    puts @bank_statement
    return header +  " #{@date} || #{@credit} || #{@debit} || #{@balance}"
  end

  def header
    return "date || credit || debit || balance \n"
  end

  def deposit(date,credit)
    @date = date
    @credit = '%.2f' % credit
    
    @balance = @credit.to_i + @balance.to_i
    @balance = '%.2f' % @balance
  end

  def withdrawal(date,debit)
    @date = date
    @credit = nil
    @debit = '%.2f' % debit
    @balance = @balance.to_i - @debit.to_i
    @balance = '%.2f' % @balance
  end
end