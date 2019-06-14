//
//  GuideViewModel.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 12/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
class GuideViewModel: NSObject {
    let db = Database.database().reference()
    
    func GetNotifications(uid:String,callBack: @escaping ResponseHandlerBlock)
    {
        let department_ref = db.child("Notifications").child(appdelegate.dept!).child(uid)
        
        
        //let engdept_info = department_ref.child("-KqC83JYCQkZB7wjI6YJ")
        
        //Departments
        
        var departmentList:[GuideDataModel] = []
        print(department_ref)
        
        department_ref.observe(.value, with:
            { (snapshot) in
                
                departmentList.removeAll()
                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
                //  print("dept eventDataloc : = \(eventDataloc)")
                //  departmentList.removeAll()
                
                for (key,val) in eventDataloc
                {
                    
                    let department_ref = self.db.child("Notifications").child(appdelegate.dept!).child(uid).child(key)
                    
                    var departmentList : [GuideDataModel] = []
                    print(department_ref)
                    
                    
                    department_ref.observe(.value, with:
                        { (snapshot) in
                            
                            let eventDataloc1 = snapshot.value as? [String: AnyObject] ?? [:]
                            print("dept eventDataloc : = \(eventDataloc1)")
                            
                            
                            let obj = GuideDataModel.fetchNotificns(notify: eventDataloc1)
                            departmentList.append(obj)
                            
                            
                            callBack(departmentList as AnyObject? ?? "" as AnyObject, nil)
                    })
                    
                    
                }
                
        })
        
    }


}
