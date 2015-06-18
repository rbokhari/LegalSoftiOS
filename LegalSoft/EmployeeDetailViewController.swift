//
//  EmployeeDetailViewController.swift
//  LegalSoft
//
//  Created by rahman on 1/27/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: UIViewController {

    @IBOutlet weak var imgPic: UIImageView!
    
    @IBOutlet weak var lblCode: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNameEn: UILabel!
    @IBOutlet weak var lblFamily: UILabel!
    @IBOutlet weak var lblSection: UILabel!
    @IBOutlet weak var lblGSM: UILabel!
    @IBOutlet weak var lblOccupation: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    
    @IBOutlet weak var lblAllowance: UILabel!
    @IBOutlet weak var lblBank: UILabel!
    @IBOutlet weak var lblBranch: UILabel!
    @IBOutlet weak var lblAccountNo: UILabel!
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    
    @IBOutlet weak var lblNationality: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
