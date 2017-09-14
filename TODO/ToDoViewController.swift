//
//  ViewController.swift
//  TODO
//
//  Created by Liseth Cardozo Sejas on 9/13/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController, addItemDelegate {
    var todos = [["Cook", "tasty food for baby", "12/23/17"],["study Recursion", "ITs good for me", "3/12/17"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("its working")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomCell
        cell?.titleLabel.text = todos[indexPath.row][0]
        cell?.descriptionLabel.text = todos[indexPath.row][1]
        cell?.dateLabel.text = todos[indexPath.row][2]
        return cell!
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //add check mark when the user type the cell
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
    }
    
    //********prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddItemViewController
        destination.delegate = self
    }
    
    //Conform add protocol function
    func addItemToTODOList(by: AddItemViewController, title: String, description: String, date: String) {
        todos.append([title, description, date])
        tableView.reloadData()
        dismiss(animated: true, completion: nil )
    }

}

