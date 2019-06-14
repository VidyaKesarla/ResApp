//
//  ScholarsPopupViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 10/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase

protocol scholarproto
{
    func selectingScholar(Selected:String, SelectedUid: String)
}
class ScholarsPopupViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
      var ScholarArray:[GuideDataModel] = []
    
    var notifcationdata:String?
    
      var dataupdated:[String] = []
    var delegate:scholarproto?
    @IBOutlet weak var scholarlist: UITableView!
    var scholerdata: [String] = []
    var finalscholer:[String] = []
    
    var finalscholeruid:[String] = []
   // var
     var arrSelectedScholar :[Int] = []
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalscholer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var siricell = UITableViewCell()
        
        if tableView == scholarlist        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! scholarlistTableViewCell
            
            cell.scholarname.text = self.finalscholer[indexPath.row]
            cell.schuid.text = self.finalscholeruid[indexPath.row]
           // cell.secondapprovallabel.text = self.useridarray[indexPath.row]
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            // cell.lblStudentName.text = getStudentName[indexPath.row]
            
            if arrSelectedScholar.contains(indexPath.row)
            {
                //  cell.btnCheckbox.setImage(UIImage(named: "selectedItem"), for: .normal)
                cell.checkboximg.image = UIImage(named: "check")
            }
            else
            {
                //cell.btnCheckbox.setImage(UIImage(named: "unSelectedItem"), for: .normal)
                cell.checkboximg.image = UIImage(named: "uncheck")
            }
            
           siricell = cell
            
        }
        
    return siricell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the indexpath = \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! scholarlistTableViewCell
        
        
        
        if let index = arrSelectedScholar.index(of: indexPath.row)
        {
            arrSelectedScholar.remove(at: index)
            
            dataupdated.remove(at: index)
            self.scholarlist.reloadData()
            //   selected = indexPath.row - indexPath.row
            cell.checkboximg.image = UIImage(named: "check")
            
            // print("selected lblStudentName = \(cell.approvallabel.text!)")
            print("data updated after remove = \(self.dataupdated)")
            finalselectedscholer.remove(at: index)
            finalscholeruid.remove(at: index)
            self.scholarlist.reloadData()
        }
        else
        {
            
            self.arrSelectedScholar.append(indexPath.row)
            
            cell.checkboximg.image = UIImage(named: "uncheck")
            
            
            let index = tableView.indexPathForSelectedRow
            let cell = tableView.cellForRow(at: index!) as! scholarlistTableViewCell
            
            
            // print("de selected lblStudentName = \(cell.approvallabel.text!)")
            self.dataupdated.append(cell.scholarname.text!)
            finalselectedscholer.append(cell.scholarname.text!)
            finalscholeruid.append(cell.schuid.text!)
            // print("the userid = \(dataupdated[indexPath.row])")
            //print("hiddenuserid = \(useridarray[indexPath.row])")            self.delegate?.selectingScholar(Selected: self.finalscholer[indexPath.row])
         //   self.updateduserid.append(cell.secondapprovallabel.text!)
         //   print("updateduserid = \(self.updateduserid)")
            print("data updated = \(self.dataupdated)")
            self.scholarlist.reloadData()
           // self.updatedtb.reloadData()
            
        }
    }
        
  

    
   
    
 
    @IBAction func save(_ sender: Any)
    {
        
       self.appendtofirebase(selectedscholer: finalscholer, Uid: finalscholeruid)
        
    }
    
    
    func appendtofirebase(selectedscholer:[String],Uid:[String])
    {
        for (S1,S2) in zip(selectedscholer, Uid)
        {
        print("schoalr name",S1)
            print("scholaruid",S2)
            let db = Database.database().reference()
            let parent = db.child("Notifications").child(appdelegate.dept!).child(S2).childByAutoId()
           // let data = [appdelegate.notification] as String
            let data = ["notify":notifcationdata] as [String:Any]
            parent.setValue(data)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.fetchMyScholars(year: appdelegate.year!, dept: appdelegate.dept!,userid: appdelegate.uid!)

        // Do any additional setup after loading the view.
    }
    func fetchMyScholars(year: String, dept: String,userid: String){
        
       
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(userid)
        
        // print("year = \(appdelegate.year)")
        //print("dept = \(appdelegate.dept)")
        //observing the data changes
        self.ScholarArray.removeAll()
        self.scholerdata.removeAll()
        ref.observe(DataEventType.value) { (snapshot) in
            print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            //print("event = \(event)")
            for (key,value) in event!
            {
                let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(userid).child(key).child("scholars")
                
                
                ref.observe(DataEventType.value) { (snap) in
                    print("snap = \(snap)")
                    
                    let event1 = snap.value as? [String:Any]
                    //print("event2 = \(event)")
                    for (key1,value1) in event1!
                    {
                        let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(userid).child(key).child("scholars").child(key1)
                        //   print("event1 = \(event)")
                        ref.observe(DataEventType.value) { (snap1) in
                            print("snap = \(snap1)")
                            let event2 = snap1.value as? [String:Any]
                    
                    
                    //   print("event1 = \(event)")
                    
                    let obj = GuideDataModel().fetchScholars(data: ((event2)!))
                    self.ScholarArray.append(obj)
                   
                     self.getdata(data: self.ScholarArray)
                            
                }
                    
            }
            
        }
        
        
    }
        }
    }
    

   
    func getdata(data:[GuideDataModel])
    {
        self.scholerdata.removeAll()
        self.finalscholer.removeAll()
        self.finalscholeruid.removeAll()
       
        if data.count > 0
        {
            for i in data
            {
                self.finalscholer.append(i.scholarname!)
                self.finalscholeruid.append(i.scholaruid!)
                
            }
            print("self approval array = \(self.finalscholer)")
        }
        self.scholarlist.reloadData()
    }
   
}

