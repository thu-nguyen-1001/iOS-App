/* COSC 316 - Lab 3
 * Name: Thi Anh Thu Nguyen
 * Student ID: 300290862
 **************************/
import UIKit

/* 1 */
class Employee  {
    var name: String
    var id: String
    var jobTitle: String
    var yearsOfService: Int
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int) {
        self.name = name
        self.id = id
        self.jobTitle = jobTitle
        self.yearsOfService = yearsOfService
    }
    func pay() -> Double {
        return 100.00;
    }
    func toString() -> String {
        return "Name: \(name)\nID: \(id)\nTitle: \(jobTitle)\nYears Of Service: \(yearsOfService)";
    }
}

// Number formatter
var formatter = NumberFormatter()
formatter.numberStyle = .currency
// test Employee class
var emp1 = Employee(name:"Peter Long", id:"112-22-3011", jobTitle:"Volunteer Worker", yearsOfService:5)
print ("1.")
print (emp1.toString())
print ("Reimbursement Amount: \(String(describing: formatter.string(from: emp1.pay() as NSNumber)!))")
print ("Thank you for your volunteer work and time!")
print("---------------------------------------------------------")

/* 2 */
class SalaryEmployee : Employee {
    var annualSalary: Double
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double) {
        self.annualSalary = annualSalary
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
    }
    override func pay() -> Double {
        return (annualSalary / 26);
    }
    override func toString() -> String {
        return super.toString() + "\nAnnual Salary: \(String(describing: formatter.string(from: annualSalary as NSNumber)!))"
                                + "\nPaycheck Amount: \(String(describing: formatter.string(from: pay() as NSNumber)!))";
    }
}
// test SalaryEmployee class
var emp2 = SalaryEmployee(name:"Martine Short", id:"116-23-6418", jobTitle:"Manager", yearsOfService:8, annualSalary: 78600.00)
print ("2.")
print(emp2.toString())
print("---------------------------------------------------------")

/* 3 */
class HourlyEmployee : Employee {
    var hourlyRate: Double
    var hoursWorked: Double
    
    init(name: String, id: String, jobTitle: String, yearsOfService: Int, hourlyRate: Double, hoursWorked: Double) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService)
        
    }
    override func pay() -> Double {
        return (hoursWorked <= 80) ? (hourlyRate * hoursWorked) : (hourlyRate * 80 + hourlyRate * (hoursWorked - 80) * 1.5);
    }
    override func toString() -> String {
        return super.toString()
            + "\nHourly Rate: \(String(describing: formatter.string(from: hourlyRate as NSNumber)!))"
            + "\nHours Worked: \(hoursWorked)"
            + "\nPaycheck Amount: \(String(describing: formatter.string(from: pay() as NSNumber)!))"
    }
}
// test HourlyEmployee class
print("3.")
var emp3 = HourlyEmployee(name:"Susan Johnson", id:"123-32-3515", jobTitle:"Receptionist", yearsOfService:10, hourlyRate: 16, hoursWorked: 84)
print(emp3.toString())
print("-------------------------------------------------------")
var emp4 = HourlyEmployee(name:"Paul Simon", id:"133-53-4019", jobTitle:"System Support Analyst", yearsOfService:4, hourlyRate: 22.0, hoursWorked: 75)
print(emp4.toString())
print("-------------------------------------------------------")

/* 4 */
class Executive : SalaryEmployee {
    var bonus: Double
    
    override init(name: String, id: String, jobTitle: String, yearsOfService: Int, annualSalary: Double) {
        bonus = 0
        super.init(name: name, id: id, jobTitle: jobTitle, yearsOfService: yearsOfService, annualSalary: annualSalary)
    }
    override func pay() -> Double {
        return super.pay() + bonus;
    }
    override func toString() -> String {
        return super.toString() + "\nBonus Awarded \(String(describing: formatter.string(from: bonus as NSNumber)!))"
    }
}
// test Executive class
var emp5 = Executive(name: "Steve Job", id: "111-22-3333", jobTitle: "CEO", yearsOfService: 25, annualSalary: 1000000.0)
print ("4.")
print (emp5.toString())
print ("\n----------------------------------------------------")
print ("3% bonus to be awarded for this paycheck:\n")
emp5.bonus = emp5.pay() * 0.03
print (emp5.toString())
emp5.bonus = 0.0
print ("-------------------------------------------------------")

/* 5 */
var employeeArr : [Employee] = [emp1, emp2, emp3, emp4, emp5]
print ("5.")
print ("Printing all employees using an array!\n")
for emp in employeeArr {
    if let e = emp as? Executive {
        print ("3% bonus to be awarded for the current paycheck!")
        e.bonus = e.pay() * 0.03
        print(e.toString())
        e.bonus = 0.0
    }
    else if (emp is SalaryEmployee || emp is HourlyEmployee) {
        print (emp.toString())
    }
    else {
        print (emp.toString())
        print ("Reimbursement Amount: \(String(describing: formatter.string(from: emp.pay() as NSNumber)!))")
        print ("Thank you for your volunteer work and time!")
    }
    print ("-------------------------------------------------------")
}

/* 6 */
var employeeDic = [String : Employee]()
employeeDic[emp1.id] = emp1
employeeDic[emp2.id] = emp2
employeeDic[emp3.id] = emp3
employeeDic[emp4.id] = emp4
employeeDic[emp5.id] = emp5
print ("6.")
print ("Printing all employees using a Dictionary!\n")
for emp in employeeDic {
    if let e = emp.value as? Executive {
        print ("3% bonus to be awarded for the current paycheck!")
        e.bonus = e.pay() * 0.03
        print(e.toString())
        e.bonus = 0.0
    }
    else if (emp.value is SalaryEmployee || emp.value is HourlyEmployee) {
        print (emp.value.toString())
    }
    else {
        print (emp.value.toString())
        print ("Reimbursement Amount: \(String(describing: formatter.string(from: emp.value.pay() as NSNumber)!))")
        print ("Thank you for your volunteer work and time!")
    }
    print ("-------------------------------------------------------")
}
