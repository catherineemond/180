require 'pg'

class ExpenseData
  def initialize
    @connection = PG.connect(dbname: 'expense_project')
    setup_schema
  end

  def list_expenses
    all_expenses = @connection.exec('SELECT * FROM expenses ORDER BY created_on ASC')
    display(all_expenses)
  end

  def add_expense(amount, memo)
    @connection.exec_params("INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, now());", [amount, memo])
  end

  def search_expense(query)
    matching_expenses = @connection.exec_params("SELECT * FROM expenses WHERE memo ILIKE $1", [query])
    display(matching_expenses)
  end

  def delete_expense(id)
    if valid_id?(id)
      deleted_expense = @connection.exec_params("SELECT * FROM expenses WHERE id = $1", [id])
      @connection.exec_params("DELETE FROM expenses WHERE id = $1", [id])
      puts 'The following expense has been deleted:'
      display(deleted_expense)
    else
      puts "There is no expense with id #{id}."
    end
  end

  def delete_all_expenses
    @connection.exec("DELETE FROM expenses;")
    puts 'All expenses have been deleted.'
  end

  private

  def setup_schema
    result = @connection.exec("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'expenses'")

    if result[0]['count'] == '0'
      sql = File.read('./schema.sql')
      @connection.exec(sql)
    end
  end

  def display(expenses)
    total = expenses.field_values('amount').map(&:to_f).sum
    count = expenses.ntuples
    display_number_of_expenses(count)

    expenses.each do |tuple|
      columns = [
        tuple['id'].rjust(3),
        tuple['created_on'].rjust(10),
        tuple['amount'].rjust(12),
        tuple['memo']
      ]
      puts columns.join(' | ')
    end

    display_total(total) if count > 0
  end

  def display_number_of_expenses(count)
    case count
    when 0 then puts 'There are no expenses.'
    when 1 then puts 'There is 1 expense.'
    else        puts "There are #{count} expenses."
    end
  end

  def display_total(total)
    puts '--------------------------------------------'
    puts "Total" + "#{format('%.2f', total)}".rjust(26)
  end

  def valid_id?(id)
    all_ids = @connection.exec('SELECT * FROM expenses').column_values(0).map(&:to_i)
    all_ids.include?(id)
  end
end
