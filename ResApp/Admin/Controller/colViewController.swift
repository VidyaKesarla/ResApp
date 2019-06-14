//
//  colViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 19/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class colViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    var dept:String?
   
    
    @IBOutlet weak var year: UITextField!
    
    private let reuseIdentifier = "deptCell"
    
    
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
                    self.dept = "cse"
                    print("cse")
                }
                else if((indexPath.row) == 1) {
                    self.dept = "ise"
                }
                else if((indexPath.row) == 2) {
                    self.dept = "eee"
                }
                else if((indexPath.row) == 3) {
                    self.dept = "ece"
                }
                else if((indexPath.row) == 4) {
                    self.dept = "mech"
                }
                else if((indexPath.row) == 5) {
                    self.dept = "civil"
                }
                let vc = ResearchGuideViewController(nibName: "ResearchGuideViewController", bundle: nil)
                vc.selectedYear = year.text
        
                navigationController?.pushViewController(vc, animated: true)
        self.performSegue(withIdentifier: "tab2", sender: self)
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? ResearchGuideViewController {
            viewControllerB.selectedDept = dept
            viewControllerB.selectedYear = year.text
        }
    }
 
    
    override func viewDidLoad() {
            super.viewDidLoad()
           // initialise()
        }
    


    


}


//        let controller = storyboard?.instantiateViewController(withIdentifier: "guide")
//        //self.present(ViewController, animated: false, completion: nil)
//        //self.present(controller,animated: true, completion: nil)
