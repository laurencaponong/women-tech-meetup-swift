//
//  ConvertTime.swift
//  women-tech-app
//
//  Created by Caponong, Lauren on 4/14/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import Foundation

extension NSDate {
    
    func convertToString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "EEEE, MMMM, dd, yyyy hh:mma"
        
        let dateString = dateFormatter.stringFromDate(self)
        
        return dateString
    }
    
}