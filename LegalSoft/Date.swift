//
//  Date.swift
//  LegalSoft
//
//  Created by rahman on 1/10/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import Foundation

class Date {
    
    class func from (year year:Int, month:Int, day:Int) -> NSDate{
        
        let components = NSDateComponents()
        
        components.year = year
        components.month = month
        components.day = day
        
        let gregorianCalendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        
        let date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
        
    }
    
    class func toString(date date:NSDate) -> String {
        
        let dateStringFromat = NSDateFormatter()
        dateStringFromat.dateFormat = "yyyy-MM-dd"
        
        let dateString = dateStringFromat.stringFromDate(date)
        
        return dateString
    }
    
}