/* COSC 316 - Lab 2
 * Name: Thi Anh Thu Nguyen
 * ID: 300290862
 ***************************/
import UIKit

/* ------------------ 1 ------------------*/
// create function 'Employee'
typealias Employee = (name: String, id: String, jobtitle: String, yearOfService: Int, annualsalary: Double)
// create 4 tuples
let employee1 = Employee(name: "Peter Long", id: "112-22-3011", jobtitle: "Volunteer Worker", yearOfService: 5, annualsalary: 1200.00)
let employee2 = Employee(name: "Martine Short", id: "116-23-6418", jobtitle: "Manager", yearOfService: 8, annualsalary: 78600.00)
let employee3 = Employee(name: "Susan Johnson", id: "123-32-3515", jobtitle: "Receptionist", yearOfService: 10, annualsalary: 38600.00)
let employee4 = Employee(name: "Paul Simon", id: "133-53-4019", jobtitle: "System Support Analyst", yearOfService: 8, annualsalary: 65000.00)
// add 4 tuples into array 'employes'
var employees: [Employee] = [employee1, employee2, employee3, employee4]
// print out name, id and job title
for emp in employees {
    print (emp.name + "\t\t\t" + emp.id + "\t\t\t" + emp.jobtitle)
}
// print out tuple having the highest salary
func highestSalary(emps: [Employee]) -> Employee {
    var highestSalary = 0.0
    var employee: Employee = ("", "", "", 0, 0.0)
    for emp in emps {
        if (emp.annualsalary > highestSalary) {
            highestSalary = emp.annualsalary
            employee = emp
        }
    }
    return employee
}
// test highestSalary
print()
print ("Highest paid employee: ", highestSalary(emps: employees))
print ("\n")

/*----------------- 2 -----------------*/
// create dictionary dict-employees
var dict_employees = [String: Employee]()
// copy Employee object from 'employees' into 'dict_employees'
for emp in employees {
    dict_employees[emp.id] = emp
}
// print out name, id and job title
for emp in dict_employees {
    print (emp.value.name + "\t\t\t" + emp.value.id + "\t\t\t" + emp.value.jobtitle)
}
// print out the employee having the highest salary
func highestSalary(emps: [String: Employee]) -> Employee {
    var highestSalary = 0.0
    var employee: Employee = ("", "", "", 0, 0.0)
    for emp in emps {
        if (emp.value.annualsalary > highestSalary) {
            highestSalary = emp.value.annualsalary
            employee = emp.value
        }
    }
    return employee
}
// test highestSalary
print ()
print ("Highest paid employee: ", highestSalary(emps: employees))
print ()
