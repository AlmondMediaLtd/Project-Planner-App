//
//  UIFixer.swift
//  Evolve Fitness
//
//  Created by user on 16/11/2015.
//  Copyright © 2015 Almond Media. All rights reserved.
//

import Foundation
import UIKit

//Global Constants
let NUMBER_OF_SECONDS_IN_A_DAY : Int = 86400;

class UtilityCode{
    
    static func drawBorder(view: UIView, width: CGFloat, color: UIColor)
    {
        
    }
    
    static func makeDateFrom(year: Int = 0, month: Int = 0, day:Int = 0, hour: Int = 0, minutes:Int = 0, seconds: Int = 0) -> NSDate
    {
        let components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minutes
        components.second = seconds
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        return (calendar?.dateFromComponents(components))!
    }
    
    static func makeDateFromString(dateInString: String) -> NSDate
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm";
        let date = dateFormatter.dateFromString(dateInString);
        
        return date!;
    }
    
    static func makeDateFromUniversalDateString(var dateString:NSString) -> NSDate{
        
        dateString = dateString.substringToIndex(19).stringByReplacingOccurrencesOfString("T", withString: " ");
        
        
        let dateFormatter = NSDateFormatter()
        
        if(dateString.length == 19)
        {
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss" //This is the format returned by .Net website
        }
        else if(dateString.length == 20)
        {
            dateFormatter.dateFormat = "YYYY-MM-ddTHH:mm:ss" //This is the format returned by .Net website
        }
        else if(dateString.length == 21)
        {
            dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.S" //This is the format returned by .Net website
        }
        else if(dateString.length == 22)
        {
            dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SS" //This is the format returned by .Net website
        }
        else if(dateString.length == 23)
        {
            dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS"
        }
        else if(dateString.length == 25)
        {
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss +0000"
        }
        
        let date = dateFormatter.dateFromString(dateString as String)
        
        
        return date!;
        
    }
    
    static func getDateString(date:  NSDate, format: String = "yyyy-MM-dd") -> String
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format;
        return formatter.stringFromDate(date);
    }
    
    
    static func propertyValuesFromObjectArray(objects:[AnyObject], propName: String) -> [AnyObject]
    {
        var propertyValues : [AnyObject] = [];
        if(objects.count > 0)
        {
            for index in 0...(objects.count-1){
                propertyValues.append(objects[index].valueForKey(propName)!);
            }
        
        }
        return propertyValues;
    }
    
    static func getCurrencyFormatter (locale : String = "en-GB") -> NSNumberFormatter
    {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: locale);
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        
        return formatter
    }
    
    static func numToCurrency (number: NSDecimalNumber) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en-GB");
        
        let num = Double(number);
        
        if floor(num) == num {
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 0
        }
        else {
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
        }
        return formatter.stringFromNumber(num)!
    }
    
    static func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }
    
    static func isValidEmail(testStr: String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    static func getBarcodeImage(string : String) -> UIImage? {
        
        let data = string.dataUsingEncoding(NSASCIIStringEncoding)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter!.setValue(data, forKey: "inputMessage")
        return UIImage(CIImage: filter!.outputImage!)
        
    }
    
    static func getDaysBetweenDate(startDate: NSDate, endDate: NSDate) -> Int
    {
        let calendar = NSCalendar.currentCalendar()
        
        
        let components = calendar.components([.Day], fromDate: calendar.startOfDayForDate(startDate),
            toDate: calendar.startOfDayForDate(endDate), options: [])
        
        return components.day
    }
    
}