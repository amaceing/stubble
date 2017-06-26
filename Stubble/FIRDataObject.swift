//
//  FIRDataObject.swift
//
//  Created by Callam Poynter on 24/06/2016.
//

import Foundation
import Firebase
import FirebaseDatabase

class FIRDataObject: NSObject {
    
    var snapshot: FIRDataSnapshot
    var key: String { return snapshot.key }
    var ref: FIRDatabaseReference { return snapshot.ref }
    
    
    required init(_ snapshot: FIRDataSnapshot) {
        self.snapshot = snapshot
        super.init()
        for child in snapshot.children.allObjects as! [FIRDataSnapshot] {
            if responds(to: Selector(child.key)) {
                if (child.value as? NSDictionary) != nil{
                    setValue(NSDate(timeIntervalSinceReferenceDate: (child.value as! NSDictionary)["timeIntervalSinceReferenceDate"] as! TimeInterval), forKey: child.key)
                } else {
                    setValue(child.value!, forKey: child.key)
                }
                
            }
        }
    }
    
    init(dict: NSDictionary) {
        self.snapshot = FIRDataSnapshot()
        super.init()
        setValuesForKeys(dict as! [String : Any])
    }
    
    class func create(name: String, snapshot: FIRDataSnapshot) -> FIRDataObject?
    {
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        guard let any : AnyObject.Type = NSClassFromString(appName + "." + name) else
        {
            return nil;
        }
        
        guard let ns = any as? FIRDataObject.Type else
        {
            return nil;
        }
        return ns.init(snapshot)
    }
}

protocol FIRDatabaseReferenceable {
    var ref: FIRDatabaseReference { get }
}

extension FIRDatabaseReferenceable {
    var ref: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
}
