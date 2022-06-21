require "employee"

class Startup
attr_reader :name, :salaries, :funding, :employees
    def initialize (name, funding, salaries)
        @name = name
        @salaries = salaries
        @funding = funding
        @employees = []
    end

    def valid_title?(str)
        @salaries.include?(str)
    end

    def > (startup)
        self.funding > startup.funding
    end

    def hire(emp, title)
        if @salaries.include?(title)
            newhire = Employee.new(emp,title)
            @employees << newhire
        else
                raise "Invalid Employee Title"
         end
    end

    def size
         @employees.count
    end
    
    def pay_employee(emp)
        salary = @salaries[emp.title]
        if @funding > salary 
            @funding -= salary
            emp.pay(salary)
        else
            raise "this employee is going to starve this week"
        end
    end

    def payday
        @employees.each {|emp| pay_employee(emp)}
    end

    def average_salary
        total = 0
        @employees.each { |emp| total += @salaries[emp.title]  }
       return total/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
       @funding += startup.funding 
       startup.salaries.each do |k,v|
       if !@salaries.include?(k)
        @salaries[k] = v
       end
       end
     @employees += startup.employees
        startup.close
    end
end
