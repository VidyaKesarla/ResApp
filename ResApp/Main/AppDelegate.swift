//
//  AppDelegate.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 28/02/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

let appdelegate = UIApplication.shared.delegate as! AppDelegate
var somearray:[Admindatamodel] = []

var finalselectedscholer:[String] = []

var scholerdep:String?


typealias ResponseHandlerBlock = ( _ responseObject : AnyObject, _ errorObject : NSError?) -> ()
let defaults = UserDefaults.standard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("in appdelegate")
        print("Application did finish launching")
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = .black
        UINavigationBar.appearance().backgroundColor = .orange
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().barTintColor = .orange
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.black]
        
        // UIBarButtonItem.appearance().tintColor = UIColor.magentaColor()
        
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        return true
    }
    var cs:Int = 0
    var ise:Int = 0
    
    var mech:Int = 0
    
    var civil:Int = 0
    
    var ece:Int = 0
    
    var eee:Int = 0
    
    var unique:String?
    var publicnno:[Int] = []
    var slidervalue:Int?
    var notification:String?
    var uid:String?
    var guidename:String?
    var somedata:[Admindatamodel] = []
    var window: UIWindow?
    var dept:String?
    var year:String?
    struct newGuide {
        var Guidename:String?
        var Dob:String?
        var Gend:String?
        var Nationality:String?
        var Contactno:String?
        var Emailid:String?
        var Address:String?
        var Correspondence:String?
        var Employmenttype:String?
        var Award:String?
        var Fieldofexpertise:String?
        var Patents:String?
        var Projects:String?
        var uid:String?
        
        //
        init()
        {
            //
        }
        //
        init(withdict dict:[String:AnyObject])
        {
            Guidename = dict["Guidename"] as? String ?? ""
            Dob = dict["Dob"] as? String ?? ""
            Gend = dict["Gend"] as? String ?? ""
            Nationality = dict["Nationality"] as? String ?? ""
            Contactno = dict["Contactno"] as? String ?? ""
            Emailid = dict["Emailid"] as? String ?? ""
            Address = dict["Address"] as? String ?? ""
            Correspondence = dict["Correspondence"] as? String ?? ""
            Employmenttype = dict["Employmenttype"] as? String ?? ""
            Award = dict["Award"] as? String ?? ""
            Fieldofexpertise = dict["Fieldofexpertise"] as? String ?? ""
            Patents = dict["Patents"] as? String ?? ""
            Projects = dict["Projects"] as? String ?? ""
            uid = dict["uid"] as? String ?? ""
            
        }
    }
    
    struct membership{
        var Slno:String?
        var Body:String?
        var From:String?
        var To:String?
        var orgname:String?
        
        init(){
            
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            Body = dict["Body"] as? String ?? ""
            From = dict["From"] as? String ?? ""
            To = dict["To"] as? String ?? ""
            orgname = dict["orgname"] as? String ?? ""
            
        }
        
    }
    struct membArr{
        var all = [membership]()
    }
    var memb = membership()
    var Memb = membArr()
    struct service{
        var Slno:String?
        var From:String?
        var To:String?
        var NOY:String?
        var Degree:String?
        var Designation:String?
        var Instname:String?
        init(){
            
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            From = dict["From"] as?
                String ?? ""
            To = dict["To"] as?
                String ?? ""
            NOY = dict["NOY"] as?
                String ?? ""
            Degree = dict["Degree"] as?
                String ?? ""
            Designation = dict["Designation"] as?
                String ?? ""
            Instname = dict["Instname"] as?
                String ?? ""
        }
    }
    struct ServiceArr{
        var all = [service]()
    }
    var svc = service()
    var Svc = ServiceArr()
    struct Guides {
        var Guidename:String?
        var Dob:String?
        var Gend:String?
        var Nationality:String?
        var Contactno:String?
        var Emailid:String?
        var Address:String?
        var Correspondence:String?
        var Employmenttype:String?
        var Award:String?
        var Fieldofexpertise:String?
        var Patents:String?
        var Projects:String?
        
    }
    struct GuideArr{
        var all = [Guides]()
    }
    
    struct education {
        var Slno:String?
        var Degree:String?
        var Branch:String?
        var Specialisation:String?
        var YOP:String?
        var University:String?
        //
        init()
        {
            //
        }
        //
        init(withdict dict:[String:AnyObject])
        {
            Slno = dict["Slno"] as? String ?? ""
            Degree = dict["Degree"] as? String ?? ""
            Branch = dict["Branch"] as? String ?? ""
            Specialisation = dict["Specialisation"] as? String ?? ""
            YOP = dict["YOP"] as? String ?? ""
            University = dict["University"] as? String ?? ""
            
        }
    }
    struct EdnArr{
        var all = [education]()
    }
    var Edn = EdnArr()
    var edn = education()
    struct journals{
        var Slno:String?
        var Coauthorname:String?
        var Papertitle:String?
        var Journalname:String?
        var Publisher:String?
        var Citation:String?
        
        init(){
            
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            Coauthorname = dict["Coauthorname"] as? String ?? ""
            Papertitle = dict["Papertitle"] as? String ?? ""
            Journalname = dict["Journalname"] as? String ?? ""
            Publisher = dict["Publisher"] as? String ?? ""
            Citation = dict["Citation"] as? String ?? ""
            
            
        }
    }
    struct journArr{
        var all = [journals]()
    }
    struct conferences{
        var Slno:String?
        var Coauthorname:String?
        var Papertitle:String?
        var Confname:String?
        var Publisher:String?
        var Citation:String?
        
        init(){
            
        }
        init(withdict dict:[String:AnyObject]){
            Slno = dict["Slno"] as? String ?? ""
            Coauthorname = dict["Coauthorname"] as? String ?? ""
            Papertitle = dict["Papertitle"] as? String ?? ""
            Confname = dict["Confname"] as? String ?? ""
            Publisher = dict["Publisher"] as? String ?? ""
            Citation = dict["Citation"] as? String ?? ""
            
            
        }
    }
    struct confArr{
        var all = [conferences]()
    }

var aone = Guides()
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UITabBar.appearance().barTintColor = .white
//        UITabBar.appearance().tintColor = .black
//        UINavigationBar.appearance().backgroundColor = .orange
//        UINavigationBar.appearance().tintColor = .black
//        UINavigationBar.appearance().barTintColor = .orange
//
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.black]
//
//       // UIBarButtonItem.appearance().tintColor = UIColor.magentaColor()
//
//        // Override point for customization after application launch.
//        FirebaseApp.configure()
//        return true
//    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

