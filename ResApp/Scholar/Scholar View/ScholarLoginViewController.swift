//
//  ScholarLoginViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 14/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class ScholarLoginViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    
    
    
    
    //
    //  selectViewController.swift
    //  ResApp
    //
    //  Created by Vidya Srinivasa Kesarla on 29/04/19.
    //  Copyright © 2019 sjbit. All rights reserved.
    //
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
    
        private let reuseIdentifier = "deptCell"
        //var dept:String?
        @IBOutlet weak var year: UITextField!
        
        @IBAction func next(_ sender: Any) {
            // print(year)
            //        let vc = ResearchGuideViewController(nibName: "ResearchGuideViewController", bundle: nil)
            //        vc.selectedDept = self.dept
            //        vc.selectedYear = self.year.text
            // navigationController?.pushViewController(vc, animated: true)
            appdelegate.year = self.year.text
            self.performSegue(withIdentifier: "screen2", sender: self)
        }
        
        var deptFiles1 = [String]()
        //var deptImages = [UIImage]()
        var deptFiles = ["cse2.jpg","ise2.jpg","ece2.jpg","eee2.jpg","mech2.jpg","civil2.jpg"]
        var deptNames = ["CSE","ISE","ECE","EEE","MECH","CIVIL"]
        
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! newCollectionViewCell
            
            let image = UIImage(named: deptFiles[indexPath.row])
            // let names = UILabel
            // cell.imageView.image = image
            cell.imageView.image = image
            
            cell.deptname.text = "\(deptNames[indexPath.row] ?? "")"
            
            //cell.deptname.text = name
            
            
            return cell
            //return cell
        }
        
        
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 50, height: 414)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if((indexPath.row) == 0) {
                appdelegate.dept = "cse"
                print("cse")
            }
            else if((indexPath.row) == 1) {
                appdelegate.dept = "ise"
                print("ise")
            }
            else if((indexPath.row) == 2) {
                
                appdelegate.dept = "ece"
                print("ece")
            }
            else if((indexPath.row) == 3) {
                appdelegate.dept = "eee"
                print("eee")
            }
            else if((indexPath.row) == 4) {
                appdelegate.dept = "mech"
                print("mech")
            }
            else if((indexPath.row) == 5) {
                appdelegate.dept = "civil"
                print("civil")
            }
            
            //self.performSegue(withIdentifier: "tab2", sender: self)
        }
        //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        if((indexPath.row) == 0) {
        //            self.dept = "cse"
        //            print("cse")
        //        }
        //        else if((indexPath.row) == 1) {
        //            self.dept = "ise"
        //        }
        //        else if((indexPath.row) == 2) {
        //            self.dept = "eee"
        //        }
        //        else if((indexPath.row) == 3) {
        //            self.dept = "ece"
        //        }
        //        else if((indexPath.row) == 4) {
        //            self.dept = "mech"
        //        }
        //        else if((indexPath.row) == 5) {
        //            self.dept = "civil"
        //        }
        //        let vc = ResearchGuideViewController(nibName: "ResearchGuideViewController", bundle: nil)
        //        vc.selectedYear = year.text
        //
        //        navigationController?.pushViewController(vc, animated: true)
        //        self.performSegue(withIdentifier: "tab2", sender: self)
        //    }
        //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if let viewControllerB = segue.destination as? ResearchGuideViewController {
        //            let yr = year.text
        //            viewControllerB.selectedDept = self.dept
        //            viewControllerB.selectedYear = self.year.text
        //        }
        //    }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

    //fter loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


