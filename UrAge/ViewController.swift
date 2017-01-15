//
//  ViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 15/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var toolbar: UIToolbar!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var bdDatePickerTextfield: UITextField!
    
    var isSetBD:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSettingForBD()
        
        initialSettingForUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func editDateAction(_ sender: UIDatePicker) {

    }

    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {

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
            bdDatePickerTextfield.text = date
            //save birthday to local storage
            UserDefaults.standard.set(date, forKey: "birthday")
            UserDefaults.standard.synchronize()
            
            view.endEditing(true)
        }
    }

}

