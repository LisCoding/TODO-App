//
//  AddItemViewController.swift
//  TODO
//
//  Created by Liseth Cardozo Sejas on 9/13/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    
    
    @IBOutlet weak var notesLabel: UITextField!
    
    @IBOutlet weak var dateLabel: UIDatePicker!
    
    var delegate : addItemDelegate?
    
    @IBAction func addItemButtonWasPressed(_ sender: UIButton) {
        //format the date
        let myDate = dateLabel.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from:myDate)
        //calling the delegate
        delegate?.addItemToTODOList(by: self, title: titleLabel.text!, description: notesLabel.text!, date: dateString)
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
