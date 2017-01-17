//
//  ViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 15/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    @IBOutlet weak var addPhotoBtn: UIButton!
    @IBOutlet weak var birthdayLabel: UILabel!

    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ageWithoutYearLabel: UILabel!{
        didSet {
            ageWithoutYearLabel.font = ageWithoutYearLabel.font.monospacedDigitFont
        }
    }

    
    var isSetBD:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSettingForBD()
        
        //make button to circle 
        addPhotoBtn.layer.cornerRadius = addPhotoBtn.frame.width/2
        
    }
    @IBAction func addPhotoAction(_ sender: UIButton) {
        
        // use camer to take the picture
        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.delegate = self
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

