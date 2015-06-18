//
//  CaseDetailViewController.swift
//  LegalSoft
//
//  Created by rahman on 1/13/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import UIKit

class CaseDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        /*lblFileNo.text = caseFile!.FileNo
        lblClientName.text = caseFile!.ClientName
        //lblStartDate.text = caseFile.
        lblCourtCase.text = caseFile!.CourtCaseNo
        lblMainCourt.text = caseFile!.MainCourt
        lblDefender.text = caseFile!.DefenderLawyer
        lblLawyer.text = caseFile!.LawyerName*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnNavigationCancel_Click(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
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
