//
//  ViewControllerExtension.swift
//  UrAge
//
//  Created by LIN TINGMIN on 15/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit

extension ViewController{
    
    func initialSettingForUI(){
        // setting for birthday date textfield
        bdDatePickerTextfield.inputView = datePicker
        bdDatePickerTextfield.inputAccessoryView = toolbar
        
        
        // setting for datePicker
        datePicker.backgroundColor = UIColor.white
        
        // setting for toolbar
        
        
    }
    
    func initialSettingForBD(){
        if let userBirthday = UserDefaults.standard.string(forKey: "birthday"){
            bdDatePickerTextfield.text = userBirthday
        }else{
            print("first day to use the app")
            let dateFormatter = DateFormatter()
            let today = Date()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let todayString = dateFormatter.string(from: today)
            bdDatePickerTextfield.text = todayString
            UserDefaults.standard.set(todayString, forKey: "birthday")
            UserDefaults.standard.synchronize()
        }
    }
}
