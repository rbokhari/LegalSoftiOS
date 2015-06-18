//
//  EmployeeViewController.swift
//  LegalSoft
//
//  Created by rahman on 1/24/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var employees:[Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let empService:PostService = PostService()
        
        empService.getPost{
            (response) in
            //print(response.count)
            self.loadData(response as NSArray)
            
            self.collectionView.reloadData()
        }
        
    }
    
    func loadData(data:NSArray){
        for emp in data {
            //println(emp)
            //var empid = emp.valueForKey("employeeID")! as NSString
            //println(empid)
            let id = emp.valueForKey("employeeID")! as! Int
            let code = emp.valueForKey("empCode") as! String
            let empName = emp.valueForKey("empName") as? String
            let empNameEn = emp.valueForKey("empName_EN") as? String
            let family = emp.valueForKey("familyName") as? String
            let section = emp.valueForKey("sectionID")! as? Int
            let gsm = emp.valueForKey("gsm") as? String
            let occup = emp.valueForKey("occupation") as? String
            let email = emp.valueForKey("empEmail") as? String
            let level = emp.valueForKey("levelID")! as? Int
            let address = emp.valueForKey("mailAddress") as? String
            let salary = emp.valueForKey("empSalary")! as? Double
            let allowance:Double = 0 // emp.valueForKey("empAllowance") as String == nil ? emp.valueForKey("empAllowance") : 0
            let pass = emp.valueForKey("empPassword")! as? String
            let bank = emp.valueForKey("bankName")! as? String
            let branch = emp.valueForKey("branchName")! as? String
            let account = emp.valueForKey("accountNo")! as? String
            let start = emp.valueForKey("startDate")! as? String
            let end = emp.valueForKey("endDate")! as? String
            let active = emp.valueForKey("isActive")! as? Int
            let admin = emp.valueForKey("isAdmin")! as? Int
            let nationality = emp.valueForKey("nationalityID")! as? Int
            let emppic = emp.valueForKey("empPic")! as? String
    
            
            //print(id)
            
            var emp = Employee(id: id, code: code, name: empName, nameEn: empNameEn, family: family, section: section, gsm: gsm, email: email, level: level, address: address, salary: salary, allowance: allowance, bank: bank, branch: branch, account: account, start: start, end: end, pic: emppic, active: active, admin: admin, nationalityId: nationality)
            
            employees.append(emp)
            
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("empCell", forIndexPath: indexPath) as! EmpCollectionViewCell
        cell.lblEmpName.text = employees[indexPath.row].EmpName
        print(employees[indexPath.row].EmpName)

        print(employees[indexPath.row].EmpPic != nil)
        if employees[indexPath.row].EmpPic != nil {
            print(employees[indexPath.row].EmpPic)
            
            //let str:NSString = "data:image/jpg;base64,"
            //str.stringByAppendingString(employees[indexPath.row].EmpPic)
            // NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:str]];
            //let imageData:NSData = NSData(contentsOfURL: NSURL(string: str as String)!)!
            //var fulldata = NSData(base64EncodedString: employees[indexPath.row].EmpPic as String, options: NSDataBase64DecodingOptions.RawValue)
            //let decodedData = NSData(base64EncodedString: employees[indexPath.row].EmpPic, options: 0)
            //cell.imgPic.image = UIImage(data: imageData)
            //cell.imgPic.image = UIImage(contentsOfFile: self.employees[indexPath.row].EmpPic as String)
            //let encodedImageData = employees[indexPath.row].EmpPic
            //let imageData = NSData(base64EncodedString: encodedImageData, options: .allZeros)
            
            //let imagedata1 = NSData(base64EncodedString: encodedImageData, options: NSDataBase64DecodingOptions.fromRaw(0)!)
            
            //let image = UIImage(data: imageData)
            //cell.imgPic.image = image
            
            let decodedData = NSData(base64EncodedString: employees[indexPath.row].EmpPic, options: NSDataBase64DecodingOptions(rawValue: 0))
            let decodedimage = UIImage(data: decodedData!)
            //print(decodedimage)
            cell.imgPic.image = decodedimage

        }
        else{
            cell.imgPic.image = UIImage(imageLiteral: "profilepic")
        }
        
        cell.spinner.stopAnimating()
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
