//
//  MOUser.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/23.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import Foundation
import CoreData

@objc(MOUser)
class MOUser: NSManagedObject {
    
    @NSManaged var userId: String
    @NSManaged var age: NSNumber
    @NSManaged var name: String
    @NSManaged var createdAt: NSDate
    
    class func entityName() -> String{ return "User" } //for MagicalRecord
}