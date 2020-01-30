//
//  CategoryTemplateModel.swift
//  Todo
//
//  Created by Mohammed Drame on 1/23/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation


class Model {

    var categoryName : String
    var categoryDate: String

    
    // init class
    init(categoryName: String, categoryDate: String) {

        self.categoryName = categoryName
        self.categoryDate = categoryDate

    }

}


// Assiging Template classs
class SetData {


    var db: [Model] = []

    // dummy data base
    let firstDummy = Model(categoryName: "Work Out", categoryDate: "01 / 24 / 20")



    // we will porpulate our collection view with the collectio.
    func data()->[Model] {

        return db
    }


    func setTheData(){
        db.append(firstDummy)
    }

}
