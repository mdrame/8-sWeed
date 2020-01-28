//
//  CategoryTemplateModel+CoreDataProperties.swift
//  Todo
//
//  Created by Mohammed Drame on 1/27/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryTemplateModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryTemplateModel> {
        return NSFetchRequest<CategoryTemplateModel>(entityName: "CategoryTemplateModel")
    }

    @NSManaged public var categoryName: String?
    @NSManaged public var categoryDate: String?

}
