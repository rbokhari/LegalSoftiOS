//
//  SecondViewController.swift
//  LegalSoft
//
//  Created by rahman on 12/28/14.
//  Copyright (c) 2014 VE. All rights reserved.
//

import UIKit

class CaseViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    var caseType:[CaseFile] = []
    var caseTypeFilter: [CaseFile] = []
    
    var refreshControler = UIRefreshControl()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var tblCases: UITableView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBAction func segValueChange(sender: UISegmentedControl) {
        
        switch (segControl.selectedSegmentIndex){
        case 1:
            caseTypeFilter = caseType.filter({ $0.StatusId == 0})
            break;
        case 2:
            caseTypeFilter = caseType.filter({ $0.StatusId == 1})
            break;
        default:
            caseTypeFilter = caseType
            break;
        }
        //caseTypeFilter = caseType
        tblCases.reloadData()
    }
    
    // MARK: UISearchBarDelegate -- Start
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.hashValue > 0 {
            caseTypeFilter = caseType.filter({$0.ClientName == searchText || $0.FileNo == searchText})
        }
        else {
            caseTypeFilter = caseType
        }
        
        self.tblCases.reloadData()
    }
    
    // UISearchBarDelegate --- End
    
    
    // MARK: UITableViewDataSource ---- Start
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return caseTypeFilter.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return loadData(tableView, indexPath: indexPath)
    }
    
    func loadData(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        //println(caseTypeFilter.count)
        //println("row coutn \(indexPath.row)")
        let cell = tableView.dequeueReusableCellWithIdentifier("cellCase", forIndexPath: indexPath) as! CaseTableViewCell
        cell.lblFileNo.text = caseTypeFilter[indexPath.row].FileNo
        cell.lblDefenderName.text = caseTypeFilter[indexPath.row].DefenderLawyer
        cell.lblClientName.text = caseTypeFilter[indexPath.row].ClientName
        
        switch caseTypeFilter[indexPath.row].StatusId{
        case 1:
            cell.contentView.backgroundColor = UIColor.cyanColor()
            break
        case 0:
            cell.contentView.backgroundColor = UIColor.lightGrayColor()
            break
        default:
            break;
        }
        
        print(indexPath.row + 1 == caseTypeFilter.count)
        
        if indexPath.row + 1 == caseTypeFilter.count{
            print("true condition")
            activityIndicator.stopAnimating()
        }
        
        return cell
    }
    

    
    //--- UITableViewDataSource  -  End --------
    
    @IBAction func btnNavigationCancel_Click(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*var caseDetail:CaseDetailViewController = CaseDetailViewController()
        
        if segue.identifier == "caseDetailSegue" {
            println("Total Filter : \(caseTypeFilter.count)")
            println("current position : \(self.tblCases.indexPathForSelectedRow()!.row)")
            //caseDetail.caseFile = caseTypeFilter[self.tblCases.indexPathForSelectedRow()!.row]
            
        }*/
    }*/
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        refreshControler.alignmentRectForFrame(CGRectMake(0.0, 100, 10, 10))
        refreshControler.backgroundColor = UIColor.grayColor()
        refreshControler.attributedTitle = NSAttributedString(string: "Last Update at \(NSDate())")
        
        refreshControler.addTarget(self, action: "didRefreshControl", forControlEvents: UIControlEvents.ValueChanged)
        self.tblCases.addSubview(refreshControler)
        
        activityIndicator.startAnimating()
        
        //activityIndicator.frame = CGRectMake(0, 0, 320, 44);
        //activityIndicator.backgroundColor = UIColor.grayColor()
        //activityIndicator.startAnimating()
        //self.tblCases.tableHeaderView = activityIndicator
        //self.tblCases.addSubview(activityIndicator)
        
        // just delay here
        //delay(0.2){
        print("inside delay start")
            
        let casetype = CaseFile()
        
        casetype.CaseFileId = 1
        casetype.FileNo = "001"
        casetype.ClientId = 1
        casetype.ClientName  = "Bank Muscat"
        casetype.CourtCaseNo = "CRT - 001"
        casetype.DefenderLawyer = "Defendent Lawyer"
        casetype.LawyerName = "Lawyer Name 1"
        casetype.MainCourt = "Main Court"
        casetype.StatusId = 1
        
        
        let casetype2 = CaseFile()
        casetype2.CaseFileId = 2
        casetype2.FileNo = "002"
        casetype2.ClientId = 1
        casetype2.ClientName  = "Bank Muscat"
        casetype2.CourtCaseNo = "CRT - 101"
        casetype2.DefenderLawyer = "Defendent Lawyer"
        casetype2.LawyerName = "Lawyer Name 1"
        casetype2.MainCourt = "Main Court"
        casetype2.StatusId = 1

        let casetype3 = CaseFile()
        casetype3.CaseFileId = 3
        casetype3.FileNo = "003"
        casetype3.ClientId = 1
        casetype3.ClientName  = "Nizwa Muscat"
        casetype3.CourtCaseNo = "CRT - 001"
        casetype3.DefenderLawyer = "Defendent Lawyer"
        casetype3.LawyerName = "Lawyer Name 1"
        casetype3.MainCourt = "Main Court"
        casetype3.StatusId = 0


        self.caseType = [casetype, casetype2, casetype3]
        self.caseTypeFilter = self.caseType
        
        self.segControl.selectedSegmentIndex = 0
            print("finish delay")
            
        // Remove activity from tblCases footerView 
        //self.tblCases.tableHeaderView = nil
        //}
    }
    
    func didRefreshControl(){
        let casetype = CaseFile()
        
        casetype.CaseFileId = 1
        casetype.FileNo = "004"
        casetype.ClientId = 1
        casetype.ClientName  = "Mohsin Header Darwish"
        casetype.CourtCaseNo = "CRT - 001"
        casetype.DefenderLawyer = "Defendent "
        casetype.LawyerName = "Lawyer 1"
        casetype.MainCourt = "Main Court 2"
        casetype.StatusId = 1
        
        caseTypeFilter.append(casetype)
        self.tblCases.reloadData()
        
        refreshControler.endRefreshing()
    }
    
    func delay(delayTime:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW, Int64(delayTime * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

