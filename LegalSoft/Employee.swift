//
//  Employee.swift
//  LegalSoft
//
//  Created by rahman on 1/24/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import Foundation

class Employee{
    
    var EmpId:Int
    var EmpCode:String
    var EmpName:String!
    var EmpNameEn:String!
    var FamilyName:String!
    var SectionId:Int!
    var GSM:String!
    var EmpEmail:String!
    var LevelId:Int!
    var Address:String!
    var EmpSalary:Double!
    var EmpAllowance:Double!
    var BankName:String!
    var BranchName:String!
    var AccountNo:String!
    var StartDate:String!
    var EndDate:String!
    var EmpPic:String!
    var isActive:Int!
    var isAdmin:Int!
    var NationalityId:Int!
    var CreatedBy:String!
    var CreatedOn:NSDate!
    
    init(id:Int, code:String, name:String?, nameEn:String?, family:String?, section:Int?, gsm:String?, email:String?, level:Int?, address:String?, salary:Double?, allowance:Double?, bank:String?, branch:String?, account:String?, start:String?, end:String?, pic:String?, active:Int?, admin:Int?, nationalityId:Int?)
    {
        
        self.EmpId = id
        self.EmpCode = code
        self.EmpName = name
        self.EmpNameEn = nameEn
        self.FamilyName = family
        self.SectionId = section
        self.GSM = gsm
        self.EmpEmail = email
        self.LevelId = level
        self.Address = address
        self.EmpSalary = salary
        self.EmpAllowance = allowance
        self.BankName = bank
        self.BranchName = branch
        self.AccountNo = account
        self.StartDate = start
        self.EndDate = end
        self.EmpPic = pic
        self.isActive = active
        self.isAdmin = admin
        self.NationalityId = nationalityId
        
    }
    
    
}