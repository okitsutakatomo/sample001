//
//  QueueHelper.swift
//  sample001
//
//  Created by Takatomo Okitsu on 2015/02/12.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import UIKit

class QueueHelper: NSObject {
    
    private struct Static{
        static var backgroundQueueForSave = dispatch_queue_create("com.okitsutakatomo.background.queue.save", DISPATCH_QUEUE_SERIAL);
    }
    
    class var sharedInstance : QueueHelper {
        struct Static {
            static let instance : QueueHelper = QueueHelper()
        }
        return Static.instance
    }
    
    func saveQueue() -> dispatch_queue_t {
        return Static.backgroundQueueForSave
    }
    
}
