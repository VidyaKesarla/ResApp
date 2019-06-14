//
//  UserdetilsDataModel.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 02/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class UserdetilsDataModel: NSObject {
    
    
    var rolename:Int?
    var department:String?
    
    //Users data
    func getalluserdetails(userdata:[String:Any]) -> UserdetilsDataModel
    {
        let userobj = UserdetilsDataModel()
        for (key,val) in userdata
        {
            print("the key = \(key)")
            switch key
            {
            case "role":
                userobj.rolename = val as? Int ?? 0
                
            case "dept":
                userobj.department = val as? String ?? ""
                
                
            default:
                break
            }
        }
        
        return userobj

    }
    
    
    
    var notificationmsg:String?
    
    func getnotification(notify:[String:Any]) -> UserdetilsDataModel
    {
        let userobj = UserdetilsDataModel()
        for (key,val) in notify
        {
            //print("the key = \(key)")
            switch key
            {
            case "notify":
                userobj.notificationmsg = val as? String ?? ""
                
                
            default:
                break
            }
        }
        
        return userobj
        
    }
    
    //Users data
    var noofpublications:Int?
    
    func numberofpublication(userdata:[String:Any]) -> UserdetilsDataModel
    {
        let userobj = UserdetilsDataModel()
        for (key,val) in userdata
        {
            print("the key = \(key)")
            switch key
            {
            case "noofpublications":
                userobj.noofpublications = val as? Int ?? 0
          
            default:
                break
            }
        }
        
        return userobj
        
    }
}
