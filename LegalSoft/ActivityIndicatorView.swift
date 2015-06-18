//
//  ActivityIndicatorView.swift
//  LegalSoft
//
//  Created by rahman on 1/17/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorView {
    
    var activityIndicator: UIActivityIndicatorView!
    var loadingView: UIView!
    var loadingText: UILabel!
    
    init() {
        
        loadingView = UIView(frame: CGRectMake(75, 155, 170, 170))
        loadingView.backgroundColor = UIColor.redColor()
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10.0
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicator.frame = CGRectMake(65, 40, activityIndicator.bounds.width, activityIndicator.bounds.height)
        activityIndicator.hidesWhenStopped = true
        
        loadingView.addSubview(activityIndicator)
        
        loadingText = UILabel(frame: CGRectMake(20, 115, 130, 22))
        loadingText.backgroundColor = UIColor.clearColor()
        loadingText.textColor = UIColor.whiteColor()
        loadingText.adjustsFontSizeToFitWidth = true
        loadingText.textAlignment = NSTextAlignment.Center
        loadingText.text = "Loading ..."
        
        loadingView.addSubview(loadingText)
        
    }
    
    func loadIndicator() -> UIView {
        return loadingView
    }
    
    func StartIndicator() -> Bool {
        activityIndicator.startAnimating()
        return true
    }
    
    func EndIndicator() -> Bool {
        activityIndicator.stopAnimating()
        return true
    }
    
}