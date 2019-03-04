require 'io/console'
require_relative 'expense_data'

class CLI
  COMMANDS = [
    'add AMOUNT MEMO [DATE] - record a new expense',
    'clear - delete all expenses',
    'list - list all expenses',
    'delete NUMBER - remove expense with id NUMBER',
    'search QUERY - list expenses with a matching memo field'
  ]

  def initialize
    @application = ExpenseData.new
  end

  def run(args)
    case args.first
    when 'list'
      @application.list_expenses
    when 'add'
      amount = args[1]
      memo = args[2]
      abort 'You must provide an amount and memo.' unless amount && memo
      @application.add_expense(amount, memo)
    when 'search'
      query = args[1]
      abort 'You must provide a query term.' unless query
      @application.search_expense(query)
    when 'delete'
      id = args[1].to_i
      abort 'You must provide a valid id.' unless id > 0
      @application.delete_expense(id)
    when 'clear'
      puts 'This will remove all expenses. Are you sure? (y/n)'
      answer = $stdin.getch
      if answer == 'y'
        @application.delete_all_expenses
      else
        abort
      end
    else
      display_help
    end
  end

  def display_help
    puts 'An expense recording system'
    puts ''
    puts 'Commands:'
    puts ''
    puts COMMANDS.join("\n")
  end
end
