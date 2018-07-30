require_relative 'employee'

class Manager < Employee

  attr_accessor :assigned_employees

  def initialize(name, title, salary, boss)
    super
    @assigned_employees = []
  end

  def bonus(multiplier)
    return self.salary * multiplier unless is_manager?

    bonus = @assigned_employees.reduce(0) do |sum, employee|
      if employee.is_manager?
        sum += employee.bonus(1) + employee.salary
      else
        sum += employee.salary
      end
    end * multiplier
  end

  def is_manager?
    self.class == Manager
  end
end
