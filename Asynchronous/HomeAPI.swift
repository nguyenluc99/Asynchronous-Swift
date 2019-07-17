//
//  HomeAPI.swift
//  Comic
//
//  Created by Yami No Mid on 7/8/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import Foundation
import SwiftyJSON

class HomeAPI: NSObject
{
    var id = 0
    var title: String = ""
    var img: String = ""
    var issue_name: String = ""
    
    convenience init(json: JSON)
    {
        self.init()
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.img = json["img"].stringValue
        self.issue_name = json["issue_name"].stringValue
    }
}
