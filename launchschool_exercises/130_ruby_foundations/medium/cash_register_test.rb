require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'
require 'minitest/reporters'
Minitest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    register = CashRegister.new(100)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20
    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money
    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    register = CashRegister.new(100)
    transaction = Transaction.new(15)
    transaction.amount_paid = 20
    assert_equal(register.change(transaction), 5)
  end

  def test_give_receipt
    register = CashRegister.new(100)
    transaction = Transaction.new(15)
    assert_output("You've paid $#{transaction.item_cost}.\n") { register.give_receipt(transaction) }
  end
end
