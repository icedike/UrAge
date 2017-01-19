//
//  SettingViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var guidView: UIView!
    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var bdDatePickerTextfield: UITextField!

    @IBOutlet weak var settingSuggestionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // setting for birthday date textfield
        bdDatePickerTextfield.inputView = datePicker
        bdDatePickerTextfield.inputAccessoryView = toolbar
        
        
        // setting for datePicker
        datePicker.backgroundColor = UIColor.white
        
        
        //initial the textfield when user use in the first time
        if let userBirthday = UserDefaults.standard.string(forKey: "birthday"){
            bdDatePickerTextfield.text = userBirthday
            settingSuggestionLabel.text = "Warning!! Resting the birthday would reset the data in the timeline also."
        }else{
            
            settingSuggestionLabel.text = "Hi, Please enter your birthday before you explore the other place of this app. Resting the birthday would reset the data in the timeline also. "
            
            let dateFormatter = DateFormatter()
            let today = Date()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let todayString = dateFormatter.string(from: today)
            bdDatePickerTextfield.text = todayString
            UserDefaults.standard.set(todayString, forKey: "birthday")
            UserDefaults.standard.synchronize()
        }
        
        
        bdDatePickerTextfield.tintColor = UIColor.clear
        
        //show guid view in first time
        if UserDefaults.standard.bool(forKey: "firstSettingViewController"){
            guidView.isHidden = true
        }else{
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissMissGuidView))
            guidView.addGestureRecognizer(tapGesture)
            UserDefaults.standard.set(true, forKey: "firstSettingViewController")
        }
        
        
        // Do any additional setup after loading the view.
    }

    //dissmiss guid view
    func dissMissGuidView(){
        guidView.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // make date pick initial from the date of the textfield

    @IBAction func tapTextFieldAction(_ sender: UITextField) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM-dd-yyyy"
        let date = dateformatter.date(from: bdDatePickerTextfield.text!)
        datePicker.date = date!
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        
        //only valid for old date
        if datePicker.date > Date(){
            print("too late")
            let alert = UIAlertController(title: "Error", message: "You can't be borned in the future. Please pick up another day", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            let dateformation = DateFormatter()
            dateformation.dateFormat = "MM-dd-yyyy"
            let date = dateformation.string(from: datePicker.date)
            
            if bdDatePickerTextfield.text == date {
                print("the same")
            }else{
                print("different")
                bdDatePickerTextfield.text = date
                //save birthday to local storage
                UserDefaults.standard.set(date, forKey: "birthday")
                UserDefaults.standard.synchronize()
                // if changing the birthday -> delete all data
                deleteAllFromCoreData()
            }
            view.endEditing(true)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
