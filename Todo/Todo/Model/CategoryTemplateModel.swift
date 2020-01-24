//
//  CategoryTemplateModel.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation


class CategoryTemplateModel {
    
    var categoryName : String
    var categoryDate: String
    
    var templateName: String
    
    // init class
    init(categoryName: String, categoryDate: String, templateName: String) {
        
        self.categoryName = categoryName
        self.categoryDate = categoryDate
        
        self.templateName = templateName
    }
    
    
    
    
}



class SetData {
    
    
    var db: [CategoryTemplateModel] = []
    
    // dummy data base
    let firstDummy = CategoryTemplateModel(categoryName: "Programming", categoryDate: "01 / 24 / 20", templateName: "Name")
    
    
    // we will porpulate our collection view with the collectio.
    func data()->[CategoryTemplateModel] {
        
        db.append(firstDummy)
        return db
    }
    
    
    
}
