//
//  ViewController.swift
//  CollegeTableViewDB
//
//  Created by anh thu on 2022-02-23.
//

import UIKit

class ViewController: UIViewController {
    var databasePath = String()
    var titleStringViaSegue : String?
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var program: UITextField!
    
    @IBOutlet weak var grade: UITextField!
    
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var findButton: UIButton!
        
    @IBOutlet weak var button: UIButton!
    
    @IBAction func getAction(_ sender: Any) {
        let title = button.title(for: UIControl.State.normal)
        if title == "Add a student" {
            saveRecord()
        } else if title == "Update a student" {
            updateRecord()
        } else if title == "Delete a student" {
            deleteRecord()
        }
    }
    
    @IBAction func findRecord(_ sender: Any) {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()) {
            let querySQL = "SELECT name, program, grade FROM STUDENTS2 WHERE id = '\(id.text!)'"
            let results:FMResultSet? = studentDB.executeQuery(querySQL, withArgumentsIn: [])
            if results?.next() == true {
                name.text = results?.string(forColumn: "name")
                program.text = results?.string(forColumn: "program")
                grade.text = results?.string(forColumn: "grade")
                status.text = "Record Found!"
            } else {
                name.text = ""
                program.text = ""
                grade.text = ""
                status.text = "Record not found!"
            }
            studentDB.close()
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    func saveRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()){

            let insertSQL = "INSERT INTO STUDENTS2 (name, id, program, grade) VALUES ('\(name.text!)', '\(id.text!)', '\(program.text!)', '\(grade.text!)')"
            let result = studentDB.executeUpdate(insertSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to save record"
                print("Error: \(studentDB.lastErrorMessage())")
            } else {
                status.text = "Record saved!"
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
            }
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    func updateRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        if (studentDB.open()) {
            let updateSQL = "UPDATE STUDENTS2 set name = '\(name.text!)', program = '\(program.text!)', grade = '\(grade.text!)' WHERE id = '\(id.text!)'"
            let result = studentDB.executeUpdate(updateSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to update record"
                print("Error: \(studentDB.lastErrorMessage())")
            } else {
                name.text = ""
                id.text = ""
                program.text = ""
                grade.text = ""
                status.text = "Record Updated!"
            }
            studentDB.close()
        } else {
            print("Error: \(studentDB.lastErrorMessage())")
        }
    }
    
    func deleteRecord() {
        let studentDB = FMDatabase(path: databasePath as String)
        
        if (studentDB.open()) {
            let deleteSQL = "DELETE FROM STUDENTS2 WHERE id = '\(id.text!)'"
            let result = studentDB.executeUpdate(deleteSQL, withArgumentsIn: [])
            if !result {
                status.text = "Failed to delete record"
                print("Error: \(studentDB.lastErrorMessage())")
            } else {
                status.text = "Record deleted!"
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
        override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        button.setTitle(titleStringViaSegue, for: UIControl.State.normal)

        if titleStringViaSegue == "Add a student" {
            findButton.isHidden = true
        } else if titleStringViaSegue == "Find a student" {
            findButton.isHidden = false
            button.isHidden = true
        } else {
            findButton.isHidden =  false
            button.isHidden = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        databasePath = dirPaths[0].appendingPathComponent("students2.db").path
        if !filemgr.fileExists(atPath: databasePath as String) {
            let student2DB = FMDatabase(path: databasePath as String)
            if (student2DB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS STUDENTS2 (NAME TEXT, ID TEXT PRIMARY KEY, PROGRAM TEXT, GRADE FLOAT)"
                if !(student2DB.executeStatements(sql_stmt)) {
                    print("Error: \(student2DB.lastErrorMessage())")
                }
                student2DB.close()
            } else {
                print("Error: \(student2DB.lastErrorMessage())")
            }
        }
    }
}

