class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title=, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end
    
  def bonus(multiplier)
    @bonus = @salary * multiplier
  end
  
end


class Manager < Employee
  attr_accessor :employees
  
  def initialize(name, title, salary, boss)
    super
    @employees = []
  end
  
  def bonus(multiplier)
    sum_salaries * multiplier
  end
  
  def sum_salaries
    sum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.sum_salaries
      end
      sum += employee.salary
    end
    
    sum
  end
  
end