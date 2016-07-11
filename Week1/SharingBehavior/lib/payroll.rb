class Payroll
	def initialize(employees)
		@employee_list = employees
	end
	def notify_employee(employee)
		puts "Emailing employee #{employee.email}"
	end

	def pay_employees
		total_pay = 0
		@employee_list.each do |employee|
			total_pay += employee.calculate_salary
			notify_employee(employee)
		end
	 total_pay= total_pay*1.18
	end
	
end