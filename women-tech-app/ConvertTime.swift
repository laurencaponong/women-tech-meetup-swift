//
//  ConvertTime.swift
//  women-tech-app
//
//  Created by Caponong, Lauren on 4/14/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import Foundation

extension Double {
    
    func convertFromSecsToDate(seconds:Double) -> NSDate {
        
        let interval: NSTimeInterval = seconds/1000
        let date = NSDate(timeIntervalSinceNow: interval)
        print("NSDATE: \(date)")
        return date
        
    }
}