//
//  AddItemDelegate.swift
//  TODO
//
//  Created by Liseth Cardozo Sejas on 9/13/17.
//  Copyright © 2017 Liseth Cardozo Sejas. All rights reserved.
//

import Foundation
import UIKit

protocol addItemDelegate {
    func addItemToTODOList(by: AddItemViewController, title : String, description : String, date: Date )
}
