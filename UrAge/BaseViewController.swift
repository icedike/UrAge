//
//  BaseViewController.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    var menu:CariocaMenu?
    var demoContentController:UIViewController!
    var logging = false

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // setting for menu
        //Initialise the tableviewcontroller of the menu
        let menuCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        
        
        //Set the tableviewcontroller for the menu
        menu = CariocaMenu(dataSource: menuCtrl)
        
        
        
        menu?.delegate = self
        menu?.boomerang = .none
        
        //reverse delegate for cell selection by tap :
        menuCtrl.cariocaMenu = menu
        
        //show the first demo controller
        
        
        if UserDefaults.standard.string(forKey: "birthday") != nil{
            showDemoControllerForIndex(0)
            menu?.selectedIndexPath = IndexPath(item: 0, section: 0)
        }else{
            showDemoControllerForIndex(2)
            menu?.selectedIndexPath = IndexPath(item: 2, section: 0)
        }
        
        

    }

    
    override func viewWillAppear(_ animated: Bool) {
        menu?.addInView(self.view)
        menu?.isDraggableVertically = true
        menu?.showIndicator(.right, position: .top, offset: 30)
        menu?.addGestureHelperViews([.left,.right], width:30)
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
