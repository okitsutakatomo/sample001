//
//  RealmPerformance.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/20.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class RealmPerformance: NSObject {
    
    class func calcPerform() {
        self.saveUsers()
        self.fetch()
        self.fetchAge()
    }
    
    class func saveUsers() {
        let realm = RLMRealm.defaultRealm()
        let before  = NSDate().timeIntervalSince1970
        realm.transactionWithBlock({ () -> Void in
            for i in 1...1000 {
                let user = User()
                user.id = "\(i)"
                user.name = "Takatomo Okitsu"
                user.age = i
                user.createdAt = NSDate().timeIntervalSince1970
                realm.addObject(user)
                println(i)
            }
        })

        let after  = NSDate().timeIntervalSince1970
        println(NSString(format:"%.4f", after - before))
    }
    
    class func fetch() {
        let before  = NSDate().timeIntervalSince1970
        User(forPrimaryKey: "10")
        let after  = NSDate().timeIntervalSince1970
        println(NSString(format:"%.4f", after - before))
    }
    
    class func fetchAge() {
        let before  = NSDate().timeIntervalSince1970
        let user = User.objectsWhere("age == %d",  10).firstObject() as! User
        let after  = NSDate().timeIntervalSince1970
        println(NSString(format:"%.4f", after - before))
    }
    
    class func fetchName() {
        let before  = NSDate().timeIntervalSince1970
        let user = User.objectsWhere("name == %@",  "Takatomo Okitsu").sortedResultsUsingProperty("id", ascending: true).firstObject() as! User
        let after  = NSDate().timeIntervalSince1970
        println(NSString(format:"%.4f", after - before))
    }


}
