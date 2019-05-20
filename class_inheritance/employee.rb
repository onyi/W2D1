class Employee

  attr_reader :salary, :name, :title, :boss, :employees
  def initialize(name, salary, title, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @employees = []
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  attr_reader :employees
  def initialize(name, salary, title, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @employees = []
  end

  def add_emp(emp)
    @employees << emp
  end

  def bonus(multiplier)
    sum = 0
    @employees.each do |employee|
      if !employee.employees.empty?
        sum += employee.total_salary_subordinates
      end
      sum += employee.salary
    end
    sum * multiplier
  end

  def total_salary_subordinates
    sum = 0
    @employees.each do |emp|
      sum += emp.salary
    end
    sum
  end

end

# Debugging
# ned = Manager.new("Ned", 1000000, "Founder",	nil)
# darren = Manager.new("Darren", 78000, "TA Manager",	ned)
# shawna = Employee.new("Shawna", 12000, "TA",	darren) 
# david = Employee.new("David", 10000, "TA",	darren) 

# darren.add_emp(shawna)
# darren.add_emp(david)
# ned.add_emp(darren)
# p ned.bonus(5) # => 500_000

# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000