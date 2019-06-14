//
//  GuideDataModel.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class GuideDataModel: NSObject {
    var notfdate:String?
    var notftext:String?
    var sender:String?
    var scholarname:String?
    var scholaruid:String?
    
    class func fetchNotificns(notify:[String:Any]) -> GuideDataModel
    {
        let obj = GuideDataModel()
        for (key,val) in notify        {
            print("the key are = \(key)")
            switch key
            {
            case "notfdate" :
                obj.notfdate = val as? String ?? ""
                
            case "notftext" :
                obj.notftext = val as?  String ?? ""
            case "sender" :
                obj.sender = val as? String ?? ""
                
            default:
                break
            }
        }
        return obj
    }
    func fetchScholars(data:[String:Any])->GuideDataModel{
        let basicobj = GuideDataModel()
        for(key,val) in data{
            print("key= \(key)")
            switch key
            {
            case "scholarname":
                basicobj.scholarname = val as? String ?? ""
                // case "Dob":
            //   basicobj.Dob = val as? String ?? ""
            case "scholaruid":
                basicobj.scholaruid = val as? String ?? ""
            default:
                break
            }

}
        return basicobj

}
    var sliderdata:String?
    func fetchSlider(slider:[String:Any])-> GuideDataModel{
        let basicobj = GuideDataModel()
        for(key,val) in slider{
            switch key{
            case "sliderdata":
                basicobj.sliderdata = val as? String ?? ""
            default:
                break
            }
        }
        return basicobj
    }
}
