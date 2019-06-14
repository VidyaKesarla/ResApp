//
//  PredictorViewController.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 07/06/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import CoreML

class PredictorViewController: UIViewController {
 let model = ResData()
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var citations: UITextField!
    
    @IBOutlet weak var hindex: UITextField!
    @IBOutlet weak var workload: UITextField!
    
    @IBOutlet weak var predictednumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let x = self.year.text
//        let xa = (x! as NSString).doubleValue
//        let y = self.citations.text
//        let ya = (y! as NSString).doubleValue
//        let z = self.hindex.text
//        let za = (z! as NSString).doubleValue
//        let a = self.workload.text
//        let aa = (a! as NSString).doubleValue
////        print(x,"x")
////         y = Double("\(self.citations.text)")
////        //let ya = (y?.toDouble())!
////         z = Double("\(self.hindex.text)")
////        //let za = (z?.toDouble())!
////        a = Double("\(self.workload.text)")
////        //let aa = a?.toDouble()
//        guard let publnpredict = try? model.prediction(Department: self.department.text!, Year: xa, citations: ya, hindex: za, workload: aa)
//    else {
//        fatalError("Unexpected runtime error.")
//        }
//
//
//        self.predictednumber.text = String(publnpredict.noofpublications)
//        print("predictednumber==",publnpredict.noofpublications)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func OK(_ sender: Any) {
        self.predictedvalue()
    }
    func predictedvalue(){
        
        let x = self.year.text
        let xa = (x! as NSString).doubleValue
        let y = self.citations.text
        let ya = (y! as NSString).doubleValue
        let z = self.hindex.text
        let za = (z! as NSString).doubleValue
        let a = self.workload.text
        let aa = (a! as NSString).doubleValue
        //        print(x,"x")
        //         y = Double("\(self.citations.text)")
        //        //let ya = (y?.toDouble())!
        //         z = Double("\(self.hindex.text)")
        //        //let za = (z?.toDouble())!
        //        a = Double("\(self.workload.text)")
        //        //let aa = a?.toDouble()
        print("git")
        guard let publnpredict = try? model.prediction(Department: self.department.text!, Year: xa, citations: ya, hindex: za, workload: aa)
            else {
                fatalError("Unexpected runtime error.")
        }
       // let d = String(publnpredict.noofpublications)
        
        self.predictednumber.text = String(publnpredict.noofpublications)
        
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
extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

