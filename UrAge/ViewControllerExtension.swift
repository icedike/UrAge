//
//  ViewControllerExtension.swift
//  UrAge
//
//  Created by LIN TINGMIN on 15/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit


extension ViewController{
    
    func initialSettingForBD(){
        
        birthdayLabel.alpha = 0 
        
        //initial the textfield when user use in the first time
        if let userBirthday = UserDefaults.standard.string(forKey: "birthday"){
            birthdayLabel.text = userBirthday
            
        }else{
            let dateFormatter = DateFormatter()
            let today = Date()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let todayString = dateFormatter.string(from: today)
            birthdayLabel.text = todayString
            UserDefaults.standard.set(todayString, forKey: "birthday")
            UserDefaults.standard.synchronize()
        }
        
        Timer.scheduledTimer(timeInterval: 0.01,
                             target: self,
                             selector: #selector(self.showUrAge),
                             userInfo: nil,
                             repeats: true)
    }
    
    func showUrAge(){
        let birthdayString = birthdayLabel.text!
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

        //make show every digi instead of e 
        var factorString = String(format: "%.15f", factor)
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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  
    
}
extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //self.photoImage.image = pickedImage
            UIImageWriteToSavedPhotosAlbum(pickedImage, nil, nil, nil) //照片存到相簿
        }
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
    
    }
    
}

