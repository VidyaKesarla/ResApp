
import UIKit
import Firebase

class AdminViewModel: NSObject {
    
    let db = Database.database().reference()
    
    func getuserDetails(setuserid:String,callBack:@escaping ResponseHandlerBlock )
    {
        //let db = FIRDatabase.database().reference()
        
        print("uid in clouser = \(setuserid)")
        
        let userdetails_ref = db.child("Userdetails").child(setuserid)
        
        
        // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
        var UserDetail:[UserdetilsDataModel] = []
        // var useruid:[UserdetilsDataModel] = []
        
        //       useruid.removeAll()
        //   UserDetail.removeAll()
        userdetails_ref.observe(DataEventType.value, with:
            { (snapshot) in
                print("the snap = \(snapshot)")
                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
                for (key,val) in eventDataloc
                {
                    let userdetails_ref = self.db.child("Userdetails").child(setuserid).child(key)
                    
                    
                    // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
                    var UserDetail:[UserdetilsDataModel] = []
                    // var useruid:[UserdetilsDataModel] = []
                    
                    //useruid.removeAll()
                    UserDetail.removeAll()
                    userdetails_ref.observe(DataEventType.value, with:
                        { (snapshot1) in
                            let eventDataloc1 = snapshot1.value as? [String: AnyObject] ?? [:]
                            
                            print("eventDataloc = \(eventDataloc1)")
                            let userobj = UserdetilsDataModel().getalluserdetails(userdata: eventDataloc1)
                            
                            //  let depatObj = AllUserDetails(withDictionary: eventDataloc )
                            
                            UserDetail.append(userobj)
                            
                            callBack((UserDetail as AnyObject?)!,  nil)
                    })
                }
                
        })
        
//
//    let db = Database.database().reference()
//    func getuserDetails(setuserid:String,callBack:@escaping ResponseHandlerBlock )
//    {
//        //let db = FIRDatabase.database().reference()
//
//        print("uid in clouser = \(setuserid)")
//
//        let userdetails_ref = db.child("userDetailsforlogin").child(setuserid)
//
//
//        // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
//        var UserDetail:[AllUserDetails] = []
//        var useruid:[AllUserDetails] = []
//
//        useruid.removeAll()
//        UserDetail.removeAll()
//        userdetails_ref.observe(DataEventType.value, with:
//            { (snapshot) in
//
//
//                print("snap = \(snapshot)")
//
//
//                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
//
//                print("eventDataloc = \(eventDataloc)")
//
//                let depatObj = AllUserDetails(withDictionary: eventDataloc )
//
//                UserDetail.append(depatObj)
//
//
//
//
//                callBack(UserDetail as AnyObject?,  nil)
//        })
//
//
//
//
//
//
//
//
//
//
}
}
