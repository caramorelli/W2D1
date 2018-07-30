require_relative 'manager'

class Employee

  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    return self.salary * multiplier 
  end

  def is_manager?
    self.class == Manager
  end
end



if __FILE__ == $PROGRAM_NAME
  ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
  darren = Manager.new('Darren', 'TA Manager', 78_000, ned)
  ned.assigned_employees << darren

  shawna = Employee.new('Shawna', 'TA', 12_000, darren)
  david = Employee.new('David', 'TA', 10_000, darren)
  darren.assigned_employees << shawna
  darren.assigned_employees << david
  puts ned.bonus(5)


end
