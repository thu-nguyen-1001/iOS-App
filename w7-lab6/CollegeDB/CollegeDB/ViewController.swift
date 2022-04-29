//
//  ViewController.swift
//  CollegeDB
//
//  Created by anh thu on 2022-02-22.
//

import UIKit

class ViewController: UIViewController {
    var databasePath = String()

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var program: UITextField!
    @IBOutlet weak var grade: UITextField!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var actionChoice: UISegmentedControl!

    @IBAction func getAction(_ sender: Any) {
        if (id.text == "") {
            status.text = "Status:"
            return
        }
        let actionNo = actionChoice.selectedSegmentIndex
        switch actionNo {
        case 0:
            saveRecord()
            break
        case 1:
            findRecord()
            break
        case 2:
            updateRecord()
            break
        case 3:
            deleteRecord()
            break
        default:
            break
        }
        
    }
    
    func saveRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()){

            let insertSQL = "INSERT INTO STUDENTS (name, id, program, grade) VALUES ('\(name.text!)', '\(id.text!)', '\(program.text!)', '\(grade.text!)')"
            let result = studentDB.executeUpdate(insertSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to add student"
                print("Error: \(studentDB.lastErrorMessage())")
            } else {
                status.text = "Student Added"
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    func findRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()) {
            let querySQL = "SELECT name, program, grade FROM STUDENTS WHERE id = '\(id.text!)'"
            let results:FMResultSet? = studentDB.executeQuery(querySQL, withArgumentsIn: [])
            if results?.next() == true {
                name.text = results?.string(forColumn: "name")
                program.text = results?.string(forColumn: "program")
                grade.text = results?.string(forColumn: "grade")
                status.text = "Record Found"
            } else {
                name.text = ""
                program.text = ""
                grade.text = ""
                status.text = "Record not found"
            }
            studentDB.close()
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    func updateRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()) {
            let updateSQL = "UPDATE STUDENTS set name = '\(name.text!)', program = '\(program.text!)', grade = '\(grade.text!)' WHERE id = '\(id.text!)'"
            let result = studentDB.executeUpdate(updateSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to update student"
                print("Error: \(studentDB.lastErrorMessage())")
            } else {
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
                status.text = "Student Updated"
            }
            studentDB.close()
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    func deleteRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        
        if (studentDB.open()) {
            let deleteSQL = "DELETE FROM STUDENTS WHERE id = '\(id.text!)'"
            let result = studentDB.executeUpdate(deleteSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to delete student"
                print("Error: \(studentDB.lastErrorMessage())")
            } else {
                status.text = "Student deleted"
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
            studentDB.close()
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("students.db").path
        if !filemgr.fileExists(atPath: databasePath as String) {
            let studentDB = FMDatabase(path: databasePath as String)
            if (studentDB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENTS (NAME TEXT, ID TEXT PRIMARY KEY, PROGRAM TEXT, GRADE FLOAT)"
                if !(studentDB.executeStatements(sql_stmt)) {
                    print("Error: \(studentDB.lastErrorMessage())")
                }
                studentDB.close()
            } else {
                print("Error: \(studentDB.lastErrorMessage())")
            }
        }
    }
}

