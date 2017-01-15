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
        
        //initial the textfield when user use in the first time
        if let userBirthday = UserDefaults.standard.string(forKey: "birthday"){
            bdDatePickerTextfield.text = userBirthday
        }else{
            let dateFormatter = DateFormatter()
            let today = Date()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let todayString = dateFormatter.string(from: today)
            bdDatePickerTextfield.text = todayString
            UserDefaults.standard.set(todayString, forKey: "birthday")
            UserDefaults.standard.synchronize()
        }
        
        Timer.scheduledTimer(timeInterval: 0.001,
                             target: self,
                             selector: #selector(self.showUrAge),
                             userInfo: nil,
                             repeats: true)
    }
    
    func showUrAge(){
        let birthdayString = bdDatePickerTextfield.text!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let birthday = dateFormatter.date(from: birthdayString)!
        let nowDate = Date()
        let calendar = Calendar.current
        //get years form birthday to now
        let years = calendar.dateComponents([.year], from: birthday, to: nowDate)
        let forwardBirthday  = calendar.date(byAdding: years, to: birthday)!
        let oneYear = DateComponents(year: 1)
        let futureBirthday = calendar.date(byAdding: oneYear, to: forwardBirthday)!
        let yearRange = calendar.dateComponents([.second], from: forwardBirthday, to: futureBirthday)
        let range = calendar.dateComponents([.second,.nanosecond], from: forwardBirthday, to: nowDate)
        let nanosecondTosecond:Double = Double(range.nanosecond!)/1000000000.0
        
        let factor:Double = (Double(range.second!) + nanosecondTosecond)/Double(yearRange.second!)
        var factorString = String(factor)
        let startIndex = factorString.index(factorString.startIndex, offsetBy: 1)
        if factorString.characters.count < 17 {
            factorString = factorString + "0000000000"
        }
        let endIndex = factorString.index(factorString.startIndex, offsetBy: 17)
        
        let rangeIndex = startIndex..<endIndex
        let subTotalFactor = factorString.substring(with: rangeIndex)
        
        ageWithoutYearLabel.text = subTotalFactor
        yearLabel.text = String(years.year!)
    }
    
    
}
