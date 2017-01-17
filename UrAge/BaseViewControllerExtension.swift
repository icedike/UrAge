//
//  BaseViewControllerExtension.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit



extension BaseViewController: CariocaMenuDelegate{
    
    
    // MARK: - CariocaMenu Delegate
    
    ///`Optional` Called when a menu item was selected
    ///- parameters:
    ///  - menu: The menu object
    ///  - indexPath: The selected indexPath
    func cariocaMenuDidSelect(_ menu:CariocaMenu, indexPath:IndexPath) {
        
        showDemoControllerForIndex(indexPath.row)
    }
    
    ///`Optional` Called when the menu is about to open
    ///- parameters:
    ///  - menu: The opening menu object
    func cariocaMenuWillOpen(_ menu:CariocaMenu) {
        if(logging){
            print("carioca MenuWillOpen \(menu)")
        }
    }
    
    ///`Optional` Called when the menu just opened
    ///- parameters:
    ///  - menu: The opening menu object
    func cariocaMenuDidOpen(_ menu:CariocaMenu){
        if(logging){
            switch menu.openingEdge{
            case .left:
                print("carioca MenuDidOpen \(menu) left")
                break;
            default:
                print("carioca MenuDidOpen \(menu) right")
                break;
            }
        }
    }
    
    ///`Optional` Called when the menu is about to be dismissed
    ///- parameters:
    ///  - menu: The disappearing menu object
    func cariocaMenuWillClose(_ menu:CariocaMenu) {
        if(logging){
            print("carioca MenuWillClose \(menu)")
        }
    }
    
    ///`Optional` Called when the menu is dismissed
    ///- parameters:
    ///  - menu: The disappearing menu object
    func cariocaMenuDidClose(_ menu:CariocaMenu){
        if(logging){
            print("carioca MenuDidClose \(menu)")
        }
    }
    
}

extension BaseViewController{

    // MARK: - Various demo controllers
    
    func showDemoControllerForIndex(_ index:Int){
        
        if demoContentController != nil {
            demoContentController.view.removeFromSuperview()
            demoContentController.removeFromParentViewController()
            demoContentController = nil
        }
        
        switch index {
            
        case 0:
            if let showAge = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController{
                self.addChildViewController(showAge)
                self.view.addSubview(showAge.view)
                demoContentController = showAge as UIViewController
            }
            break
        case 2:
            if let showSetting = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController{
                self.addChildViewController(showSetting)
                self.view.addSubview(showSetting.view)
                demoContentController = showSetting as UIViewController
            }
            break
        case 1:
            if let showTimeLine = self.storyboard?.instantiateViewController(withIdentifier: "TimeLineViewController") as? TimeLineViewController{
                self.addChildViewController(showTimeLine)
                self.view.addSubview(showTimeLine.view)
                demoContentController = showTimeLine as UIViewController
            }
            break
            
        default:
            break
        }
        
        demoContentController.view.translatesAutoresizingMaskIntoConstraints = false
        
        //Add constraints for autolayout
        self.view.addConstraints([
            getEqualConstraint(demoContentController.view, toItem: self.view, attribute: .trailing),
            getEqualConstraint(demoContentController.view, toItem: self.view, attribute: .leading),
            getEqualConstraint(demoContentController.view, toItem: self.view, attribute: .bottom),
            getEqualConstraint(demoContentController.view, toItem: self.view, attribute: .top)
            ])
        
        self.view.setNeedsLayout()
        
        menu?.moveToTop()
    }
    
    
    fileprivate func getEqualConstraint(_ item: AnyObject, toItem: AnyObject, attribute: NSLayoutAttribute) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: toItem, attribute: attribute, multiplier: 1, constant: 0)
    }
}
