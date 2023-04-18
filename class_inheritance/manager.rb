require_relative 'employee'

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super
        @employees = []
    end

    def add_employee(name)
        @employees << name
    end

    def bonus(multiplier)
        sum = 0
        employees.each do |employee|
            sum += employee.salary
        end
        
        bonus = sum * multiplier
        #bonus = (total salary of all sub-employees) * multiplier
    end
end
david = Employee.new("David", "TA", 10000, "Darren")

shawna = Employee.new("Shawna", "TA", 12000, "Darren")

darren = Manager.new("Darren", "TA Manager", 78000, "Ned")

ned = Manager.new("Ned", "Founder", 100000)

ned.add_employee(darren)
ned.add_employee(shawna)
ned.add_employee(david)
darren.add_employee(shawna)
darren.add_employee(david)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
