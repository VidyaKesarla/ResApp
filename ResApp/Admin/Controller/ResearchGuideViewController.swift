//
//  ResearchGuideViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 24/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ResearchGuideViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPopoverPresentationControllerDelegate {
    var GuideArray:[Admindatamodel] = []
    private let reuseIdentifier = "cell"
    var selectedYear:String?
    
    var selectedDept:String?
    let devCourses = [("Mary"),("mary"),("hsbd"),("asd"),("sdbas")]
    let devCousesImages = [UIImage(named: "person"), UIImage(named: "person"), UIImage(named: "person"),UIImage(named: "person"),UIImage(named: "person")]
    
    
   
    
    @IBOutlet weak var guidesList: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GuideArray.count
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! guideTableViewCell
        let Images = devCousesImages[indexPath .row]
        // cell.guideName.text=
        cell.guideImage.image=Images
        cell.guideName.text = GuideArray[indexPath.row].Guidename
        cell.guideUid.text = GuideArray[indexPath.row].uid
        appdelegate.uid = cell.guideUid.text
        appdelegate.guidename = cell.guideName.text
        print("appdelegate.uid===\(appdelegate.uid)")
        return cell
        
        //let courseTitle = devCourses[indexPath .row]
      
       // return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow
        let popControl = UIStoryboard(name: "AdminStoryboard", bundle: nil).instantiateViewController(withIdentifier: "guideDetailsPop") as! viewdetailspopupViewController
        let cell2 = self.guidesList.cellForRow(at: index!) as! guideTableViewCell
        popControl.modalPresentationStyle =   UIModalPresentationStyle.popover
        popControl.preferredContentSize.width = self.view.frame.size.width / 3
        popControl.preferredContentSize.height = self.view.frame.size.height / 5
        //popControl.delegate  = self;
        popControl.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        
        popControl.popoverPresentationController?.delegate = self
        popControl.popoverPresentationController?.sourceView = cell2


        popControl.popoverPresentationController?.sourceRect = (cell2.bounds)
        self.present(popControl, animated: true, completion: nil)
        
      //  let destination = storyboard.instantiateViewController(withIdentifier: "BasicDetails") as! <#type#>
        //navigationController?.pushViewController(destination, animated: true)
    }
    
    
    func fetchGuides(year: String, dept: String)
    {
        let db = Database.database().reference()
        let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept)
        
        // print("year = \(appdelegate.year)")
        //print("dept = \(appdelegate.dept)")
        //observing the data changes
        ref.observe(DataEventType.value) { (snapshot) in
            // print("snap = \(snapshot)")
            let event = snapshot.value as? [String:Any]
            //print("event = \(event)")
            for (key,value) in event!
            {
                let ref = db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(key)
                
                
                ref.observe(DataEventType.value) { (snap) in
                    // print("snap2 = \(snap)")
                    let event = snap.value as? [String:Any]
                    //print("event2 = \(event)")
                    for (key1,value1) in event!
                    {
                        let ref =
                            db.child("FetchUserdetails").child("Guide").child(year).child(dept).child(key).child(key1)
                        
                        
                        ref.observe(DataEventType.value) { (snap) in
                            print("snap1 = \(snap)")
                            let event = snap.value as? [String:Any]
                            //   print("event1 = \(event)")
                            let obj = Admindatamodel().basicguidedate(data: (event as! [String:Any]))
                            
                            self.GuideArray.append(obj)
                            print("subArray = \(self.GuideArray.count)")
                          self.guidesList.reloadData()
                            
                            
                        }
                    }
                    
                    
                }
            }
        }
    }

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.fetchGuides(year: appdelegate.year!, dept: appdelegate.dept!)

//        let vc = addGuideViewController(nibName: "addGuideViewController", bundle: nil)
//        vc.selectedYear = selectedYear
//        
//        navigationController?.pushViewController(vc, animated: true)
////
//        print("in res guide vc")
//        print(selectedDept)
//        print(selectedYear)
////        // Do any additional setup after loading the view.
    }
   
    
    /*
    import UIKit
    class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
        @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return devCourses.count
        }
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableTableViewCell
            cell.photo.image=self.devCousesImages[indexPath .row]
            cell.label.text=self.devCourses[indexPath .row]
            return cell
        }
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
