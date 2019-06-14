//
//  BarChartsYearViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 06/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Charts
import Firebase
import FirebaseDatabase
  var depvaldata:[Int] = []
  var depfinalVal:[Int] = []
   var totalisecount:Int = 0
var x:Int = 0
var y:Int = 0
var z:Int = 0
class BarChartsYearViewController: UIViewController,ChartViewDelegate,IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        return  depdata[Int(value)]

    }
    var depdata:[String] = []
    var totalisecount:Int = 0
    var totalcsecount:Int = 0
    var publicntotal: [Admindatamodel] =  []
    var totaleeecount:Int = 0
    var totalececount:Int = 0
    var totalmechcount:Int = 0
    var totalcivilcount:Int = 0
    var number:[Admindatamodel] = []
    var numberofpublications:Int = 0
    var months:[String] = []
    var publicdata:[Int] = []
    var numberpubs = [Double]()
      var temp = 0
    @IBAction func search(_ sender: Any)
    {
        //self.fetchTotalPublns(callBack: ResponseHandlerBlock)
//        self.fetchTotalPublns { (data, error) in
//            self.publicationdep = data as! [String]
//            print("self.publicationdep = \(self.publicationdep)")
        
        print("array",publicdata)
        //self.fetchTotalPublns()
//        print("cseee",self.csefetch())
//         print("yayayyy",depvaldata)
//         print("iseee",self.isefetch())
      
        //,self.eeefetch(),self.eceefetch(),self.civilfetch(),self.mechfetch()
        setChart(dataPoints: depdata, values: publicdata)
        }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ////                let controller = storyboard.instantiateViewController(withIdentifier: "admin")
        ////                self.present(controller, animated: false, completion: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "first") as! ViewController
        //
        //            let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appdelegate.window?.rootViewController = loginVC
    }
    
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var YearVsNumber: BarChartView!
   
    override func viewWillAppear(_ animated: Bool) {
        print("deptt will == \(depvaldata)")
        print("deptt will depfinalVal == \(depfinalVal)")
        
    }
    
    
    
    func finalfetchtest(callback: @escaping ResponseHandlerBlock)
    {
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("2016")
        parent3.observe(DataEventType.value) { (snapshot1) in
            // print("snap = \(snapshot)")
            var grapghdata:[Admindatamodel] = []
            let event = snapshot1.value as? [String:Any]
            for (key,val) in event!{
                 let parent4 = db.child("No of publications").child("2016").child(key)
                  parent4.observe(DataEventType.value) { (snapshot2) in
            grapghdata.removeAll()
            if snapshot2.exists()
            {
               
                print("previouss",snapshot2.value)
                let event1 = snapshot2.value as? [String:Any]
                let obj = Admindatamodel().fetchPublications(data: event1!)
                grapghdata.append(obj)
                callback(grapghdata as AnyObject, nil)
            }
            else
            {
                callback(grapghdata as AnyObject, nil)
            }
                    
            }
        }
        
            
            
            
            
        }
        
    }
      var validatedint:Int?
    var publicationobj:[UserdetilsDataModel] = []
    var publicationdep:[String] = []
        
        var finalpublicationdataobj:[Admindatamodel] = []
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.finalfetchtest { (data, error) in
            self.finalpublicationdataobj = (data as? [Admindatamodel])!
            if self.finalpublicationdataobj.count > 0
            {
                for data in self.finalpublicationdataobj
                {
                    print("the depname = \(data.deptpub!)")
                    self.depdata.append(data.deptpub!)
                    print("the number of publication data is = \(data.pubno!)")
                    self.publicdata.append(data.pubno!)
                }
                
            }
            else
            {
                print("data not aval")
            }
                
            
            
            
        }
        
      
        //actualAndTargetBarChart.noDataText = "Provide Data to the chart..!"
       
        let unitsSold:[Int] = [20, 4, 6,15,13,3]
        // let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
      //  let totalpubs:[Int] = [self.csefetch(),self.isefet
   
    }
      let totalpubs:[Int] = [13,8,0,0,0,0]
    
    func setChart(dataPoints: [String], values: [Int])
    {
        
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            // let dE = BarChartDataEntry(
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "No of publications")
        let chartData = BarChartData(dataSet: chartDataSet)
        YearVsNumber.data = chartData
        YearVsNumber.xAxis.valueFormatter = self
    }
    func csefetch(){
        let db = Database.database().reference()
     let parent3 = db.child("No of publications").child("2016").child("cse").child("noofpublications")
        parent3.observe(.childAdded, with:  { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            let temp = snapshot.value
            self.totalcsecount = temp as! Int
            depvaldata.insert(self.totalcsecount, at: 0)
            //appdelegate.cs = self.totalcsecount
            DispatchQueue.main.async(execute:{
            print("yayayyy",depvaldata)
        })
    

    })
    }
    
    func isefetch()->Int{
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("2016").child("ise").child("noofpublications")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            let temp = snapshot.value
            self.totalisecount = temp as! Int
            appdelegate.ise = self.totalisecount
            
            
        }
        return totalisecount
        
    }
    
    func eeefetch()->Int{
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("eee").child("noofpublications")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            let temp = snapshot.value
            self.totaleeecount = temp as! Int
            
            
        }
        return totaleeecount
        
    }
    
    func eceefetch()->Int{
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("ece").child("noofpublications")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            let temp = snapshot.value
            self.totalececount = temp as! Int
            
            
        }
        return totalececount
        
    }
    
    func mechfetch()->Int{
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("mech").child("noofpublications")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            let temp = snapshot.value
            self.totalmechcount = temp as! Int
            
            
        }
        return totalmechcount
        
    }
    
    func civilfetch()->Int{
        let db = Database.database().reference()
        let parent3 = db.child("No of publications").child("\(appdelegate.year ?? "")").child("civil").child("noofpublications")
        parent3.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            let temp = snapshot.value
            self.totalcivilcount = temp as! Int
            
            
        }
        return totalcivilcount
        
    }
    
    
    
    
//
//    func getdepdetails(callBack:@escaping ResponseHandlerBlock )
//    {
//        let db = Database.database().reference()
//        let userdetails_ref = db.child("No of publications").child("2016")
//
//
//        // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
//       // self.publicationobj.removeAll()
//
//        var UserDetail:[UserdetilsDataModel] = []
//
//        userdetails_ref.observe(DataEventType.value, with:
//            { (snapshot) in
//                print("the snap = \(snapshot)")
//                 self.publicationdep.removeAll()
//                UserDetail.removeAll()
//                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
//                for (key,val) in eventDataloc
//                {
//                    print("the key = \(key)")
//                    self.publicationdep.append(key)
//                    let userdetails_ref = db.child("No of publications").child("2016").child(key)
//
//
//                    userdetails_ref.observe(DataEventType.value, with:
//                        { (snapshot1) in
//                            let eventDataloc1 = snapshot1.value as? [String: AnyObject] ?? [:]
//
//
//                            let userobj = UserdetilsDataModel().numberofpublication(userdata: eventDataloc1)
//
//                            //  let depatObj = AllUserDetails(withDictionary: eventDataloc )
//
//                            UserDetail.append(userobj)
//
//                            callBack((UserDetail as AnyObject?)!,  nil)
//                    })
//                }
//
//        })
//
//        //
//        //    let db = Database.database().reference()
//        //    func getuserDetails(setuserid:String,callBack:@escaping ResponseHandlerBlock )
//        //    {
//        //        //let db = FIRDatabase.database().reference()
//        //
//        //        print("uid in clouser = \(setuserid)")
//        //
//        //        let userdetails_ref = db.child("userDetailsforlogin").child(setuserid)
//        //
//        //
//        //        // let demo = userdetails_ref.child("0Q7aMMzwXQXC5xh1quuGeHlCds92")
//        //        var UserDetail:[AllUserDetails] = []
//        //        var useruid:[AllUserDetails] = []
//        //
//        //        useruid.removeAll()
//        //        UserDetail.removeAll()
//        //        userdetails_ref.observe(DataEventType.value, with:
//        //            { (snapshot) in
//        //
//        //
//        //                print("snap = \(snapshot)")
//        //
//        //
//        //                let eventDataloc = snapshot.value as? [String: AnyObject] ?? [:]
//        //
//        //                print("eventDataloc = \(eventDataloc)")
//        //
//        //                let depatObj = AllUserDetails(withDictionary: eventDataloc )
//        //
//        //                UserDetail.append(depatObj)
//        //
//        //
//        //
//        //
//        //                callBack(UserDetail as AnyObject?,  nil)
//        //        })
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//    }
    
    
    
    
  
  
    func fetchTotalPublns()
    {
        
        let db = Database.database().reference()
        let ref = db.child("No of publications").child("2016")
        ref.observe(DataEventType.value) { (snapshot) in
            print("snap1 = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            for (key,value) in event!
            {
                let ref = db.child("No of publications").child(self.year.text!).child(key).child("noofpublications")

                ref.observe(DataEventType.value) { (snap) in
                    print("snap2 = \(snap)")
                    let event1 = snap.value as? [String:Any]
                
                    
//                    var yourArray = [Int]()
//                    if let scores = snap.value as? NSArray{
//                        for i in 0..<scores.count {
//                            print("success")
//                            yourArray.append(scores[i] as! Int)
//                            print(yourArray[i])
//                        }
//
//                    }
                    
                    
                    
                    print(snap.value!)
                  //  var arrdata:[Int] = []
                  
//                    for i in 0..<yourArray.count{
//                        print("element\(i) is ",yourArray[i])
//                    }
                    switch key {
                    case "cse":
                        x = snap.value! as! Int
                        print("cse",x)
                        self.depdata.append("cse")
                        self.publicdata.append(x)

                    case "ise":
                        y = snap.value! as! Int
                       //depvaldata[1] = snap.value! as! Int
                        //print("array of pubs",depvaldata)
                          print("ise",y)
                        self.depdata.append("ise")
                        self.publicdata.append(y)


                    case "ece":
                        z = snap.value! as! Int

                       // print("array of pubs",depvaldata)
                          print("ece",z)
                        self.depdata.append("ece")
                        self.publicdata.append(z)
                    
                    case "eee":
                       let p = snap.value! as! Int
                        
                        // print("array of pubs",depvaldata)
                        print("eee",p)
                        self.depdata.append("eee")
                        self.publicdata.append(p)
                    case "mech":
                        let q = snap.value! as! Int
                        
                        // print("array of pubs",depvaldata)
                        print("mech",q)
                        self.depdata.append("ece")
                        self.publicdata.append(q)
                    case "civil":
                        let r = snap.value! as! Int
                        
                        // print("array of pubs",depvaldata)
                        print("civil",r)
                        self.depdata.append("civil")
                        self.publicdata.append(r)
                        
                        
                        

                    default:
                        break
                    }
//                    callBack((self.publicdata as AnyObject?)!,  nil)
   // print(arrdata)
                   // self.setChart(dataPoints: self.depdata, values: depvaldata)
     
    }
        }
    }
}
        
    
    /*
    func fetchNumberOfPublications(year: String)
    {
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Scholars").child(year)
        ref.observe(DataEventType.value) { (snap1) in
            print("snap1 = \(snap1)")
            let event1 = snap1.value as? [String:Any]
            print("event1 = \(event1)")
            for (key,value) in event1!
            {
                let ref = db.child("FetchUserdetails").child("Scholars").child(year).child(key)
                print("key1:",key)
                ref.observe(DataEventType.value) { (snap2) in
                    print("snap2 = \(snap2)")
                    let event2 = snap2.value as? [String:Any]
                    print("event2 = \(event2)")
                    for (key1,value1) in event2!
                    {
                        let ref = db.child("FetchUserdetails").child("Scholars").child(year).child(key).child(key1)
                        print("key1:",key1)
                        ref.observe(DataEventType.value) { (snap3) in
                            //print("snap2 = \(snap3)")
                            let event3 = snap3.value as? [String:Any]
                            print("snap3 = \(snap3)")
                            for (key2,value2) in event3!
                            {
                                let ref = db.child("FetchUserdetails").child("Scholars").child(year).child(key).child(key1).child(key2)
                                print("key222:",key2)
                                ref.observe(DataEventType.value) { (snap4) in
                                    //print("snap2 = \(snap3)")
                                    let event4 = snap4.value as? [String:Any]
                                    print("snap4 = \(snap4)")
                                    
                        
/
                            let obj = Admindatamodel().basicscholardata(data: (event4 as! [String:Any]!))
                            self.number.append(obj)
                                    
                                    
                                    
                                    switch key {
                                    case "cse":
                                        //var temp = 0
                                        var sum = 0
                                        for j in self.number
                                        {
                                            //print("cse object",j)
                                            print("j.dept===\(j.dept)")
                                            if (j.dept=="cse")
                                            {  //print("object inside cse ",j)
                                                sum = sum + Int(j.noofpublications!)!
                                            }
                                             print("the final count of cse publication inside = \(sum)")
                                             self.totalcsecount = sum
                                            
                                        }
                                        
                                        print("the final count of cse publication = \(sum)")
                                        appdelegate.publicnno.append(self.totalcsecount)
                                        
                                         depfinalVal = depvaldata

                                        print("depvaldata\(self.depdata)")
                                        //self.depvaldata.append( self.totalcsecount)
                                        
                                        // print(self.depdata)
                                       // print(self.depvaldata)
                                    
                                        
                                    case "ise":
                                        var temp = 0
                                        var count = 0
                                        for k in self.number
                                        {
                                           // print("ise object",k)
                                            print("k.dept===\(k.dept)")
                                            if (k.dept=="ise"){
                                               // print("object inside ise ",k)
                                            count = count + Int(k.noofpublications!)!
                                            
                                        }
                                            
                                             print("the final count of ise publication inside = \(count)")
                                            totalisecount = count
                                        }
                                        print("the final count of ise publication demo = \(count)")
                                        
                                        appdelegate.publicnno.append(totalisecount)
                                        print("depvaldata\(appdelegate.publicnno)")
                                        depfinalVal = depvaldata
                                       // self.depvaldata.append( self.totalisecount)
                                        
                                        // print(self.depdata)
                                        //print(self.depvaldata)
                                    default:
                                        break
                                    }
                      }
                        
                                
                    }
                

}
}
                       print("dept value data testing  2==\(depvaldata)")
}
}

}
   
         print("dept value data testing 3 ==\(depvaldata)")
  // return totalcsecount
}*/
  


//                            if key == "cse"
//                            {
//                                var temp = 0
//                                var count = 0
//                                for j in self.number
//                                {
//                                    count = count + Int(j.noofpublications!)!
//
//                                }
//                                print("the final count of cse publication = \(count)")
//                              self.totalcsecount = count
//                                self.depvaldata.append( self.totalcsecount)
//
//                               // print(self.depdata)
//                                print(self.depvaldata)
//                            }
//                                 else   if key == "ise"
//                                    {
//                                        var temp = 0
//                                        var count = 0
//                                        for j in self.number
//                                        {
//                                            count = count + Int(j.noofpublications!)!
//
//                                        }
//                                        print("the final count of ise publication = \(count)")
//                                        self.totalisecount = count
//                                        self.depvaldata.append( self.totalisecount)
//
//                                        // print(self.depdata)
//                                        print(self.depvaldata)
//                                    }
//                                    else if key == "eee"
//                                    {
//                                        var temp = 0
//                                        var count = 0
//                                        for j in self.number
//                                        {
//                                            count = count + Int(j.noofpublications!)!
//
//                                        }
//                                        print("the final count of eee publication = \(count)")
//                                        self.totaleeecount = count
//                                        self.depvaldata.append( self.totaleeecount)
//
//                                        // print(self.depdata)
//                                        print(self.depvaldata)
//                                    }
//                                    else if key == "ece"
//                                    {
//                                        var temp = 0
//                                        var count = 0
//                                        for j in self.number
//                                        {
//                                            count = count + Int(j.noofpublications!)!
//
//                                        }
//                                        print("the final count of ece publication = \(count)")
//                                        self.totalececount = count
//                                        self.depvaldata.append( self.totalececount)
//
//                                        // print(self.depdata)
//                                        print(self.depvaldata)
//                                    }
//
//                                   else if key == "mech"
//                                    {
//                                        var temp = 0
//                                        var count = 0
//                                        for j in self.number
//                                        {
//                                            count = count + Int(j.noofpublications!)!
//
//                                        }
//                                        print("the final count of  mech publication = \(count)")
//                                        self.totalmechcount = count
//                                        self.depvaldata.append( self.totalmechcount)
//
//                                        // print(self.depdata)
//                                        print(self.depvaldata)
//                                    }
//                                  else  if key == "civil"
//                                    {
//                                        var temp = 0
//                                        var count = 0
//                                        for j in self.number
//                                        {
//                                            count = count + Int(j.noofpublications!)!
//
//                                        }
//                                        print("the final count of civil publication = \(count)")
//                                        self.totalcivilcount = count
//                                        self.depvaldata.append( self.totalcivilcount)
//
//                                        // print(self.depdata)
//                                        print(self.depvaldata)
}
