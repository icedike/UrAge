//
//  TimeLineViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit
import TimelineTableViewCell

class TimeLineViewController: UIViewController {

    @IBOutlet weak var guidView: UIView!
    // TimelinePoint, Timeline back color, title, description, lineInfo, thumbnail
    var data:[String: [(TimelinePoint, UIColor, String, String, String?, UIImage?)]] = [:]
    // find which year old 
    var year:[String] = []
    
    @IBOutlet weak var timeLineTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewDidLoad()
        
        readAgePhoto()
        
        //show guid view in first time
        if UserDefaults.standard.bool(forKey: "firstTimelineViewController"){
            guidView.isHidden = true
        }else{
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissMissGuidView))
            guidView.addGestureRecognizer(tapGesture)
            UserDefaults.standard.set(true, forKey: "firstTimeLineViewController")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
