//
//  PostService.swift
//  LegalSoft
//
//  Created by rahman on 1/24/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import Foundation

class PostService {
    
    var settings:Settings!
    
    init(){
        self.settings = Settings()
    }
    
    func getPost(callback:(NSArray) ->()){
        request(settings.URLemployee, callBack: callback)
    }
    
    
    func request(url:String, callBack:(NSArray) ->()){
        
        let nsURL = NSURL(string: url)!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(nsURL) {
            data, response, error  -> Void in
            print("......>>>>> reqeust <<<<<.....")
            if error == nil {
                let error:NSError?
                //println(NSString(data: data, encoding: NSUTF8StringEncoding))
                //let dataObject = NSData(contentsOfURL:nsURL)
                //println(dataObject)
                let resultData:NSArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                //print(resultData)
                callBack(resultData)
            }
            else {
                print("error")
            }
            //println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task!.resume()
        
    }
    
    
    // SynchonousRequest
    func request1(url:String, callBack:(NSDictionary)->()){
        let urlPath: String = url
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        let error: NSErrorPointer = nil
        let errorNS:NSError?
        let dataVal: NSData =  try! NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
        var err: NSError
        print(response)
    
        
        let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
        //println("Synchronous\(jsonResult)")
        callBack(jsonResult)
    }
    
    // AsynchonousRequest
    func request2(url:String, callBack:(NSDictionary) -> ()){
        let urlPath: String = url
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            var err: NSError
            print(data)
            let jsonResult: NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            //println("AsSynchronous\(jsonResult)")
            callBack(jsonResult)
        })
    
    }
    
    func request3(url:String, callBack:(NSDictionary) ->()){
        let urlPath = url
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                print(error?.localizedDescription)
            }
            var err: NSError?
            
            let jsonResult = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            if(err != nil) {
                // If there is an error parsing JSON, print it to the console
                print("JSON Error \(err!.localizedDescription)")
            }
            print(jsonResult)
            let results: NSArray = jsonResult["results"] as! NSArray
            print(results)
            dispatch_async(dispatch_get_main_queue(), {
                //self.tableData = results
                //self.appsTableView!.reloadData()
            })
        })
        task!.resume()
    }
}











