//
//  BMIModel+CoreDataProperties.swift
//  BMI Calculator Test 2
//
//  Created by Prajjwal Bhandari on 16/12/2022.
//
//

import Foundation
import CoreData


extension BMIModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BMIModel> {
        return NSFetchRequest<BMIModel>(entityName: "BMIModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var gender: String?
    @NSManaged public var bmi: String?
    @NSManaged public var height: String?
    @NSManaged public var weight: String?
    @NSManaged public var date: String?
    @NSManaged public var time: String?

}

extension BMIModel : Identifiable {

}
