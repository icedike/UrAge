//
//  SettingViewControllerExtension.swift
//  UrAge
//
//  Created by LIN TINGMIN on 18/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import Foundation
import CoreData

extension SettingViewController{
    func deleteAllFromCoreData(){
        let context = DataManger.share.mainContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AgePhoto")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch let error as NSError {
            debugPrint(error)
        }
    }
}
