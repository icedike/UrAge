//
//  AgePhoto+CoreDataProperties.swift
//  UrAge
//
//  Created by LIN TINGMIN on 18/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import Foundation
import CoreData


extension AgePhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AgePhoto> {
        return NSFetchRequest<AgePhoto>(entityName: "AgePhoto");
    }

    @NSManaged public var photo: NSData?
    @NSManaged public var year: String?
    @NSManaged public var afterYear: String?

}
