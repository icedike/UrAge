//
//  EventPhoto.swift
//  UrAge
//
//  Created by LIN TINGMIN on 17/01/2017.
//  Copyright © 2017 MarkRobotDesign. All rights reserved.
//

import Foundation
import TimelineTableViewCell

class EventPhoto{
    let timeLinePoint:TimelinePoint
    let lineColor:UIColor
    let description:String
    let photo:UIImage
    
    init(timeLinePoint:TimelinePoint, lineColor:UIColor, description:String, photo:UIImage){
        self.timeLinePoint = timeLinePoint
        self.lineColor = lineColor
        self.description = description
        self.photo = photo
    }
}
