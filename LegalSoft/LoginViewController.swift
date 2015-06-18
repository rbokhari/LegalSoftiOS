//
//  LoginViewController.swift
//  LegalSoft
//
//  Created by rahman on 1/16/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var optEnglish: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin_Click(sender: UIButton) {
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
