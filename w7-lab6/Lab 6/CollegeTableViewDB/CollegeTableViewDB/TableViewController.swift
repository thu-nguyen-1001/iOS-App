//
//  TableViewController.swift
//  CollegeTableViewDB
//
//  Created by anh thu on 2022-02-23.
//

import UIKit

class TableViewController: UITableViewController {
    var operations = ["Add a student", "Find a student", "Update a student", "Delete a student"]
    
    override func numberOfSections (in tableView: UITableView) -> Int { return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        cell.textLabel?.text = operations[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Database Operations"
    }
    
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "ToOperationSegue", sender: self)
    }
    override func prepare (for segue: UIStoryboardSegue, sender: Any?){ if segue.identifier == "ToOperationSegue" {
            let sdest = segue.destination as? ViewController
            let indexPath = tableView.indexPathForSelectedRow
            let titleString = operations[(indexPath?.row)!]
            sdest?.titleStringViaSegue = titleString
        }
    }
}
