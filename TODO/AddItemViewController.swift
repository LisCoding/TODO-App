//
//  AddItemViewController.swift
//  TODO
//
//  Created by Liseth Cardozo Sejas on 9/13/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit
import CoreData


class AddItemViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var notesLabel: UITextField!
    @IBOutlet weak var dateLabel: UIDatePicker!

    var delegate : addItemDelegate?
    
    //MOC instance (coreData)
    let ManageObjectContext =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func addItemButtonWasPressed(_ sender: UIButton) {
        

        //calling the delegate
        delegate?.addItemToTODOList(by: self, title: titleLabel.text!, description: notesLabel.text!, date: dateLabel.date)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
