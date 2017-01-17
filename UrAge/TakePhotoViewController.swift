//
//  TakePhotoViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit

class TakePhotoViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var photoDesTextView: UITextView!
    
    var timeForTimeLabel:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        timeLabel.text = timeForTimeLabel + " years"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
