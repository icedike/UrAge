//
//  DataManager.swift
//  UrAge
//
//  Created by LIN TINGMIN on 18/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataManger{
    private init(){ //避免再次init一次 ->
    }
    static let share = DataManger()
    lazy var mainContext:NSManagedObjectContext = {
        let mangerContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return mangerContext
    }()
}
