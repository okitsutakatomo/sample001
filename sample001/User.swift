//
//  User.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/12.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class User: RLMObject {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var age:Int = 0
    dynamic var statuses = RLMArray(objectClassName: Status.className())
    dynamic var createdAt:Double = 0
    
    override class func primaryKey() -> String {
        return "id"
    }
    
    override class func attributesForProperty(propertyName: String!) -> RLMPropertyAttributes {
        var attributes = super.attributesForProperty(propertyName)
        if propertyName == "id" {
            attributes |= RLMPropertyAttributes.AttributeIndexed
        } else if propertyName == "age" {
            attributes |= RLMPropertyAttributes.AttributeIndexed
        }
        return attributes
    }
    
    override class func defaultPropertyValues() -> [NSObject : AnyObject]! {
        return [
            "name": "",
            "createdAt": 0
        ]
    }
}
