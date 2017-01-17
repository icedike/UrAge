//
//  TimeLineVewControllerExtension.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import UIKit
import TimelineTableViewCell
import CoreData

extension TimeLineViewController{
    
    func initialViewDidLoad(){
        
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self
        
        timeLineTableView.estimatedRowHeight = 300
        timeLineTableView.rowHeight = UITableViewAutomaticDimension
        
        //register TimelineTableViewCell
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
                                             bundle: Bundle(url: nibUrl!)!)
        timeLineTableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")
    }
    
    
    func readAgePhoto(){
        let context = DataManger.share.mainContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AgePhoto")
        do {
            let results = try context.fetch(request) as! [AgePhoto]
            if results.count > 0 {
                print("\(results.count) saved in coredata")
                for result in results {
                    
                    let image = UIImage(data:(result.photo as! Data))
                    if let year = result.year,  let afterYear = result.afterYear{
                        print("year \(year) afterYear \(afterYear)")
                    }
                }
            }
        } catch {
            print("read photo data failed")
        }
    }
}

extension TimeLineViewController:UITableViewDelegate,UITableViewDataSource{
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sectionData = data[year[section]] else {
            return 0
        }
        return sectionData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Day " + String(describing: section + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        // Configure the cell...
        guard let sectionData = data[year[indexPath.section]] else {
            return cell
        }
        
        let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnail) = sectionData[indexPath.row]
        var timelineFrontColor = UIColor.clear
        if (indexPath.row > 0) {
            timelineFrontColor = sectionData[indexPath.row - 1].1
        }
        cell.timelinePoint = timelinePoint
        cell.timeline.frontColor = timelineFrontColor
        cell.timeline.backColor = timelineBackColor
        cell.titleLabel.text = title
        cell.descriptionLabel.text = description
        cell.lineInfoLabel.text = lineInfo
        if let thumbnail = thumbnail {
            cell.thumbnailImageView.image = thumbnail
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionData = data[year[indexPath.section]] else {
            return
        }
        
        print(sectionData[indexPath.row])
    }

}
