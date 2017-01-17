//
//  ViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 15/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit
import CariocaMenu

class ViewController: UIViewController {


    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ageWithoutYearLabel: UILabel!{
        didSet {
            ageWithoutYearLabel.font = ageWithoutYearLabel.font.monospacedDigitFont
        }
    }
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

    // make date pick initial from the date of the textfield
    @IBAction func tapTextFieldAction(_ sender: Any) {
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
            bdDatePickerTextfield.text = date
            //save birthday to local storage
            UserDefaults.standard.set(date, forKey: "birthday")
            UserDefaults.standard.synchronize()
            
            view.endEditing(true)
        }
    }

}

