//
//  ViewController.swift
//  TODO
//
//  Created by Liseth Cardozo Sejas on 9/13/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UITableViewController, addItemDelegate {
    
    //todos is an arr of instance of TodoList Objects
    var todos = [TodoList]()
    
    //MOC instance (coreData)
    let ManageObjectContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        cell?.titleLabel.text = todo.title
        cell?.descriptionLabel.text = todo.note
        let dateS = todo.date
    
        //convert date into str
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: dateS! as Date)
        cell?.dateLabel.text = dateString
        cell?.accessoryType = todo.check ? .checkmark : .none

        return cell!
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //add check mark when the user type the cell
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        let todo = todos[indexPath.row]
        todo.check = !todo.check
        //REFACTOR FOR BABY
        do {
            
            try ManageObjectContext.save()
            
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
       
    }
    
    //********prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddItemViewController
        destination.delegate = self
    }
    
    //Conform add protocol function
    func addItemToTODOList(by: AddItemViewController, title: String, description: String, date: Date) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "TodoList", into: ManageObjectContext)  as! TodoList
        item.title = title
        item.note = description
        item.date = date as NSDate
        todos.append(item)
        
        do {
            
            try ManageObjectContext.save()
            
        } catch {
            print("\(error)")
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil )
    }
    
    //fetch data from the database
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoList")
        do {
            //fetching the data from the dataBase and putting into the todos array
            let result = try ManageObjectContext.fetch(request)
            todos = result as! [TodoList]
            
        } catch {
            print("\(error)")
        }
    }
    
    //delete data from CoreData
    func deleteAllRecords() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoList")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }

}

