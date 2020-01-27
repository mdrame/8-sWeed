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
    
    
    // init class
    init(categoryName: String, categoryDate: String) {
        
        self.categoryName = categoryName
        self.categoryDate = categoryDate
        
    }
    
}


// Assiging Template class
//class SetData {
//    
//    
//    var db: [CategoryTemplateModel] = []
//    
//    // dummy data base
//    let firstDummy = CategoryTemplateModel(categoryName: "Work Out", categoryDate: "01 / 24 / 20")
//    
//    
//    
//    // we will porpulate our collection view with the collectio.
//    func data()->[CategoryTemplateModel] {
//        
//        return db
//    }
//    
//    
//    func setTheData(){
//        db.append(firstDummy)
//    }
//    
//}
