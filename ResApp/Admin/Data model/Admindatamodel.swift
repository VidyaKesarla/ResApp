//
//  Admindatamodel.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 20/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class Admindatamodel: NSObject
{
  //  var slno1:String?
  //  var degree:String?
    //basic details
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
    var Password:String?
    var uid:String?
    var role:Int?
    var autoid:String?
    var profileurl:UIImageView?
   
    //var uid:String?
    //education details
    var slno1:String?
    var degree:String?
    var branch:String?
    var specialisation:String?
    var yearofpassing:String?
    var university:String?
    
    //service details
    var slno2:String?
    var from2:String?
    var to2:String?
    var nOY:String?
    var degree2:String?
    var designation:String?
    var instname:String?
    
    //membership details
    var slno3:String?
    var body:String?
    var from3:String?
    var to3:String?
    var orgname:String?
    
    //journals details
    var Slno4:String?
    var Coauthorname4:String?
    var Papertitle4:String?
    var Journalname:String?
    var Publisher4:String?
    var Citation4:String?
    
    
    //conferences details
    
    var Slno5:String?
    var Coauthorname5:String?
    var Papertitle5:String?
    var Confname:String?
    var Publisher5:String?
    var Citation5:String?
    
//    init(Guidename: String?, Dob:String?,Gend:String?,Nationality:String?, Contactno:String?
//     ,Emailid:String?,Address:String?,Correspondence:String?,Employmenttype:String?
//     ,Award:String?,Fieldofexpertise:String?,Patents:String?,Projects:String? ){
//        self.Guidename = Guidename
//
    //scholar details
    var scholarname: String?
    var USN: String?
    var Yor: String?
    var schSpecialization: String?
    var noofpublications: Int?
    var Synopsis_letter : String?
    var Research_work_title: String?
    var Journal_impact_work: String?
    var Type_of_enrollment: String?
    var Guide_name: String?
    var Email: String?
    var Pwd: String?
    var Role: Int?
    var guideuid:String?
    var autoid2:String?
    var dept:String?
    
    var deptselect:String?
    var numberpubs:String?
    
    var deptpub:String?
    var pubno:Int?
    var uniqueid:String?
    
    func fetchNoOfPubs(data:[String:Any])->Admindatamodel{
        let basicobj = Admindatamodel()
        for (key,val) in data{
            switch key
            {
                
            case "deptselect":
                basicobj.deptselect = val as? String ?? ""
            case "noofpublications":
                basicobj.numberpubs = val as? String ?? ""
            default:
                break
            }
        }
        return basicobj
    }
    
    func basicguidedate(data:[String:Any]) -> Admindatamodel
    {
        let basicobj = Admindatamodel()
        for(key,val) in data{
            print("key= \(key)")
            switch key
            {
            case "guidename":
                basicobj.Guidename = val as? String ?? ""
           // case "Dob":
             //   basicobj.Dob = val as? String ?? ""
            case "gender":
                basicobj.Gend = val as? String ?? ""
            case "nationality":
                basicobj.Nationality = val as? String ?? ""
            case "contactno":
                basicobj.Contactno = val as? String ?? ""
            case "emailid":
                basicobj.Emailid = val as? String ?? ""
            case "address":
                basicobj.Address = val as? String ?? ""
            case "correspondence":
                basicobj.Correspondence = val as? String ?? ""
            case "employmenttype":
                basicobj.Employmenttype = val as? String ?? ""
            case "award":
                basicobj.Award = val as? String ?? ""
            case "fieldofexpertise":
                basicobj.Fieldofexpertise = val as? String ?? ""
            case "patents":
                basicobj.Patents = val as? String ?? ""
            case "projects":
                basicobj.Projects = val as? String ?? ""
            case "password":
                basicobj.Password = val as? String ?? ""
            case "uid":
                basicobj.uid = val as? String ?? ""
            case "role":
                basicobj.role = val as? Int ?? 1
            case "autoID":
                basicobj.autoid = val as? String ?? ""
//            case "profileurl":
//                basicobj.profileurl = val as? UIImageView
//
                
            default:
                break
            }
        }
        return basicobj
    }

    func educationdata(data:[String:Any]) -> Admindatamodel
    {
        let eductionobj = Admindatamodel()
        for (key,val) in data
        {
            switch key
            {
                
            case "slno1":
                eductionobj.slno1 = val as? String ?? ""
                
            case "degree":
                eductionobj.degree = val as? String ?? ""
                
            case "branch":
                eductionobj.branch = val as? String ?? ""
            
            case "specialisation":
                eductionobj.specialisation = val as? String ?? ""
                
            case "year of passing":
                eductionobj.yearofpassing = val as? String ?? ""
                
            case "university":
                eductionobj.university = val as? String ?? ""
                
            default:
                break
            }
        }
        return eductionobj
    }
    
    
    func servicedata(data:[String:Any]) -> Admindatamodel
    {

        let serviceobj = Admindatamodel()
        for (key,val) in data
        {
            switch key
            {
                
            case "slno2":
                serviceobj.slno2 = val as? String ?? ""
                
            case "from2":
                serviceobj.from2 = val as? String ?? ""
                
            case "to2":
                serviceobj.to2 = val as? String ?? ""
                
            case "nOY":
                serviceobj.nOY = val as? String ?? ""
                
            case "degree2":
                serviceobj.degree2 = val as? String ?? ""
                
            case "designation":
                serviceobj.designation = val as? String ?? ""
                
            case "instname":
                serviceobj.instname = val as? String ?? ""
            case "uid":
                serviceobj.uid = val as? String ?? ""
 
            default:
                break
            }
        }
        return serviceobj
    }
    
    func membershipdata(data:[String:Any]) -> Admindatamodel
    {
        
        let membershipobj = Admindatamodel()
        for (key,val) in data
        {
            switch key
            {
                
            case "slno3":
                membershipobj.slno3 = val as? String ?? ""
                
            case "body":
                membershipobj.body = val as? String ?? ""
                
            case "from3":
                membershipobj.from3 = val as? String ?? ""
                
            case "to3":
                membershipobj.to3 = val as? String ?? ""
                
            case "orgname":
                membershipobj.orgname = val as? String ?? ""
                
            default:
                break
            }
        }
        return membershipobj
    }
    
    
    
    //journals details
//    var Slno4:String?
//    var Coauthorname4:String?
//    var Papertitle4:String?
//    var Journalname:String?
//    var Publisher4:String?
//    var Citation4:String?
//
    
    func journalsdata(data:[String:Any]) -> Admindatamodel
    {
        
        let journalobj = Admindatamodel()
        for (key,val) in data
        {
            switch key
            {
                
            case "Slno4":
                journalobj.Slno4 = val as? String ?? ""
                
            case "Coauthorname":
                journalobj.Coauthorname4 = val as? String ?? ""
                
            case "Papertitle4":
                journalobj.Papertitle4 = val as? String ?? ""
                
            case "Journalname":
                journalobj.Journalname = val as? String ?? ""
                
            case "Publisher4":
                journalobj.Publisher4 = val as? String ?? ""
            
            case "Citation4":
                journalobj.Citation4 = val as? String ?? ""
                
                
            default:
                break
            }
        }
        return journalobj
    }
    

    func conferencesdata(data:[String:Any]) -> Admindatamodel
    {
        
        let conferenceobj = Admindatamodel()
        for (key,val) in data
        {
            switch key
            {
                
            case "Slno5":
                conferenceobj.Slno5 = val as? String ?? ""
                
            case "Coauthorname5":
                conferenceobj.Coauthorname5 = val as? String ?? ""
                
            case "Papertitle5":
                conferenceobj.Papertitle5 = val as? String ?? ""
                
            case "Confname":
                conferenceobj.Journalname = val as? String ?? ""
                
            case "Publisher5":
                conferenceobj.Publisher5 = val as? String ?? ""
                
            case "Citation5":
                conferenceobj.Citation5 = val as? String ?? ""
                
                
            default:
                break
            }
        }
        return conferenceobj
    }
    
    func basicscholardata(data:[String:Any]) -> Admindatamodel
    {
        
//        var USN: String?
//        var Yor: String?
//        var Specialization: String?
//        var Number_of_Publications: String?
//        var Synopsis_letter : String?
//        var Research_work_title: String?
//        var Journal_impact_work: String?
//        var Type_of_enrollment: String?
//        var Guide_name: String?
//        var Email: String?
//        var Pwd: String?
//        var Role: Int?
//

        let basicobj = Admindatamodel()
        for (key,val) in data{
            switch key{
            
            case "scholarname":
                basicobj.scholarname = val as? String ?? ""
            case "usn":
                basicobj.USN = val as? String ?? ""
            case "year of reg":
                basicobj.Yor = val as? String ?? ""
            case "specialization":
                basicobj.schSpecialization = val as? String ?? ""
            case "noofpublications":
                basicobj.noofpublications = val as? Int ?? 0
            case "synopsis letter":
                basicobj.Synopsis_letter = val as? String ?? ""
            case "researchworktitle":
                basicobj.Research_work_title = val as? String ?? ""
            case "journalimpactfactor":
                basicobj.Journal_impact_work = val as? String ?? ""
            case "Type of enrollment":
                basicobj.Type_of_enrollment = val as? String ?? ""
            case "guidename":
                basicobj.Guide_name = val as? String ?? ""
            case "Email":
                basicobj.Email = val as? String ?? ""
            case "pwd":
                basicobj.Pwd = val as? String ?? ""
            case "role":
                basicobj.Role = val as? Int ?? 2
            case "autoid":
                basicobj.autoid2 = val as? String ?? ""
            case "dept":
                basicobj.dept = val as? String ?? ""
            default:
                break
            }
        }
    
    return basicobj
}
    
    
   // var year:String?
    
    
    func fetchPublications(data:[String:Any]) -> Admindatamodel{
        let pubobj = Admindatamodel()
        
        for(key,val) in data{
            switch key{
            case "dept":
            pubobj.deptpub = val as? String ?? ""
            case "noofpublications":
                pubobj.pubno = val as? Int ?? 0
            
            default:
                break
            }
        
        
        
        
    }
        return pubobj
    
    }
    
    
}
