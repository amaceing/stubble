//
//  DB.swift
//  Stubble
//
//  Created by Dylan Intorf on 9/24/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import Foundation
import FirebaseDatabase

open class DB {
    
    open static func create(collection: String, object: NSObject) -> String
    {
        let ref: FIRDatabaseReference! = FIRDatabase.database().reference()
        do {
            let key = ref.child(collection).childByAutoId().key
            try ref.updateChildValues(["/\(collection)/\(key)":JSONSerializer.toDictionary(JSONSerializer.toJson(object))])
            return key
        } catch {
            print("Error adding to database")
        }
        return ""
    }
}
