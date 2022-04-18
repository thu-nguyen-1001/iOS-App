/* COSC 316 - Lab 2
 * Name: Thi Anh Thu Nguyen
 * ID: 300290862
 ***************************/
import UIKit

struct Employee {
    let name: String?
    let id: String?
    let jobtitle: String?
    let yearOfService: Int?
    let annualsalary: Double?
    init (name: String? = nil, id: String? = nil, title: String? = nil, year: Int? = nil,
    salary: Double? = nil){
        self.name = name
        self.id = id
        jobtitle = title
        yearOfService = year
        annualsalary = salary
    }//init
}
// create 4 tuples
let employee1 = Employee.init(name: "Peter Long", id: "112-22-3011", title: "Volunteer Worker", year: 5, salary: 1200.00)
let employee2 = Employee(name: "Martine Short", id: "116-23-6418", title: "Manager", year: 8, salary: 78600.00)
let employee3 = Employee(name: "Susan Johnson", id: "123-32-3515", title: "Receptionist", year: 10, salary: 38600.00)
let employee4 = Employee(name: "Paul Simon", id: "133-53-4019", title: "System Support Analyst", year: 8, salary: 65000.00)

/* ------------------- 1 ----------------*/
// add 4 tuples into array 'employes'
var employees: [Employee] = [employee1, employee2, employee3, employee4]
// print out name, id and job title
for emp in employees {
    if let name = emp.name, name.count > 0,
       let id = emp.id, id.count > 0,
       let title = emp.jobtitle, title.count > 0 {
        print (name + "\t\t\t" + id + "\t\t\t" + title)
    }
}
print()
// print out the employee having the highest salary
func highestSalary(emps: [Employee]) -> Employee {
    var highestSalary = 0.0
    var employee: Employee = Employee.init()
    for emp in emps {
        if let salary = emp.annualsalary, salary > highestSalary {
            highestSalary = salary
            employee = emp
        }
     }
     return employee
 }
 // test highestSalary
 print ("Highest paid employee: ", highestSalary(emps: employees))
 print ("\n")

/*----------------- 2 -----------------*/
 // create dictionary dict-employees
 var dict_employees = [String: Employee]()
 // copy Employee object from 'employees' into 'dict_employees'
 for emp in employees {
     dict_employees[emp.id!] = emp
 }
 // print out name, id and job title
 for emp in dict_employees {
    if let name = emp.value.name, name.count > 0,
       let id = emp.value.id, id.count > 0,
       let title = emp.value.jobtitle, title.count > 0 {
        print (name + "\t\t\t" + id + "\t\t\t" + title)
    }
 }
 // print out the employee having the highest salary
func highestSalary(emps: [String: Employee]) -> Employee {
    var highestSalary = 0.0
    var employee: Employee = Employee.init()
    for emp in emps {
        if let salary = emp.value.annualsalary, salary > highestSalary {
            highestSalary = salary
            employee = emp.value
        }
    }
    return employee
 }
print ()
// test highestSalary
print ("Highest paid employee: ", highestSalary(emps: dict_employees))
print ()

 
