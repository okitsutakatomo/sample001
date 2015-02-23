//
//  CoreDataPerformance.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/20.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class CoreDataPerformance: NSObject {
    class func calcPerform() {
        self.saveUsers()
        self.fetch()
//        self.fetchAge()
    }
    
    class func saveUsers() {
        let before  = NSDate().timeIntervalSince1970
        MagicalRecord.saveWithBlockAndWait({ (context) -> Void in
            for i in 1...100000 {
                let user = MOUser.MR_createEntityInContext(context)
                user.userId = "\(i)"
                let name = "Takatomo Okitsu"
                user.name = name
                user.age = i
                user.createdAt = NSDate()
                println(i)
            }
        })
        
        let after  = NSDate().timeIntervalSince1970
        println(NSString(format:"%.4f", after - before))
    }
    
    class func fetch() {
        let before  = NSDate().timeIntervalSince1970
        var userMo = MOUser.MR_findFirstByAttribute("userId", withValue: "10")
        let after  = NSDate().timeIntervalSince1970
        println(NSString(format:"%.4f", after - before))
    }
    
//    class func fetchAge() {
//        let before  = NSDate().timeIntervalSince1970
//        let user = User.objectsWhere("age == %d",  10).firstObject() as! User
//        let after  = NSDate().timeIntervalSince1970
//        println(NSString(format:"%.4f", after - before))
//    }
   
}
