//
//  ConvertTime.swift
//  women-tech-app
//
//  Created by Caponong, Lauren on 4/14/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import Foundation

<<<<<<< HEAD
=======
//extension NSDate {
//    
//    func convertToString() -> String {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.locale = NSLocale.currentLocale()
//        dateFormatter.dateFormat = "EEEE, MMMM, dd, yyyy hh:mma"
//        
//        let dateString = dateFormatter.stringFromDate(self)
//        
//        return dateString
//    }
//    
//}

>>>>>>> 4036506a6dc891229f5ed258682d7bbed4d999d8
extension Double {
    
    func convertFromSecsToDate(seconds:Double) -> NSDate {
        
        let interval: NSTimeInterval = seconds/1000
        let date = NSDate(timeIntervalSinceNow: interval)
        print("NSDATE: \(date)")
        return date
        
    }
}