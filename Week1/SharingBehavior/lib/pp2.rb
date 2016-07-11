require_relative("employee.rb")
require_relative("payroll.rb")


josh = HourlyEmployee.new("josh", "nachoemail@example.com", 35, 50)
nizar = SalariedEmployee.new("nizar", "starkraftrules@gmail.com", 1000000)
ted = MultiPaymentEmployee.new("ted", "ted@aol.com", 60000, 275, 55)
devorah = HourlyEmployee.new("devorah", "devorah@langsam.org", 15, 45)
jon = HourlyEmployee.new("jon", "jon@gmail.com", 15, 50);
employees = [josh, nizar, ted, devorah, jon]

payroll = Payroll.new(employees)
p josh.calculate_salary

puts payroll.pay_employees