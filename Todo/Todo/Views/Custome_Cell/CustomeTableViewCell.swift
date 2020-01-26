//
//  CustomeCollectionViewCell.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import Foundation

class CustomeTableViewCell: UITableViewCell {
    
    
    
    // Instance
    
    
    
    // database Instance
    
    
    
    
    // outlets
    
    @IBOutlet weak var categoryName: LabelCustomClass!
    @IBOutlet weak var date: UILabel!
    
    
    // Nob
    
    
    
    // SetUI
    
    func setUI(db object: CategoryTemplateModel) {
        
        // Assing views to model
        
        categoryName.text = object.categoryName
        date.text = object.categoryDate
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
