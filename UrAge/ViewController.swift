//
//  ViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 15/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit
import AVFoundation
import GSMessages

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
        
        
        if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) ==  AVAuthorizationStatus.authorized
        {
            // Already Authorized
             takePhoto()
        }
        else
        {
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (granted :Bool) -> Void in
                if granted == true
                {
                    // User granted
                    self.takePhoto()
                }
                else
                {
                    // User Rejected
                    DispatchQueue.main.async {
                        self.showMessage("Fail to access the camera", type: .warning)
                    }
                    
                    
                }
            });
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

