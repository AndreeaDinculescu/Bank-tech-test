require 'bank'

RSpec.describe Bank do
  it "should printing statement with default value" do
    bank = Bank.new
    result = bank.bank_statement("10/01/2023",0,0,0)
    expect(result).to eq("date || credit || debit || balance \n 10/01/2023 ||  ||  || 0.00")
    end

  it "returns a statement with credit 1000 after making a deposit" do
    bank = Bank.new
    bank.deposit("10/01/2023",1000)
    result = bank.bank_statement("10/01/2023",1000,0,0)
    expect(result).to eq("date || credit || debit || balance \n 10/01/2023 || 1000.00 ||  || 1000.00")
  end

  it "returns a statement with current balance of 2000 after making another deposit" do
    bank = Bank.new
    bank.deposit("10/01/2023",1000)
    bank.deposit("13/01/2023",2000)
    result = bank.bank_statement("13/01/2023",2000,0,1000)
    expect(result).to eq("date || credit || debit || balance \n 13/01/2023 || 2000.00 ||  || 3000.00")
  end

  it "returns a statement with current balance 2500 after withdrawal 500" do
    bank = Bank.new
    bank.deposit("10/01/2023",1000)
    bank.deposit("13/01/2023",2000)
    bank.withdrawal("14/01/2023",500)
    result = bank.bank_statement("14/01/2023",0,500,0)
    expect(result).to eq("date || credit || debit || balance \n 14/01/2023 ||  || 500.00 || 2500.00")
    end
end
