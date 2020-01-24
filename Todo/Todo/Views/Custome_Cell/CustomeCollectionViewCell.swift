//
//  CustomeCollectionViewCell.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit
import Foundation

class CustomeCollectionViewCell: UICollectionViewCell {
    
    
    // Instance
    
    
    
    // database Instance
   
    

    
    // template
    // template purpose is to be able to edit the name label programmatically.
    
    @IBOutlet var templateName: UILabel!
    
    
    // outlets
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var date: UILabel!
    
    
    // Nob
    
    
    
    
    
    
    
    
    // SetUI
    
    func setUI(db object: CategoryTemplateModel  ) {
        
        // Assing views to model
        
        templateName.text = object.templateName
        categoryName.text = object.categoryName
        date.text = object.categoryDate
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
