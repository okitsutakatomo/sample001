//
//  Status.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/12.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class Status: RLMObject {
    dynamic var id = ""
    dynamic var text = ""
    dynamic var user:User? {
         return linkingObjectsOfClass("User", forProperty: "statuses").first as? User
    }
    dynamic var createdAt:Double = 0
    
    override class func primaryKey() -> String {
        return "id"
    }
}
