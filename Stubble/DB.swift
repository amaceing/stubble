//
//  DB.swift
//  Stubble
//
//  Created by Dylan Intorf on 9/24/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import Foundation
import FirebaseDatabase

public protocol Nameable {
    static func entityName() -> String
}

open class DB {
    
    open static func create(collection: String, object: NSObject) -> String
    {
        do {
            let ref: FIRDatabaseReference! = FIRDatabase.database().reference()
            let key = ref.child(collection).childByAutoId().key
            try ref.updateChildValues(["/\(collection)/\(key)":JSONSerializer.toDictionary(JSONSerializer.toJson(object))])
            return key
        } catch {
            print("Error adding to database")
        }
        return ""
    }
    
    open static func read(collection: String, className: String) -> [NSObject]
    {
        // TODO: Create a function to read collection objects
        var items: [NSObject] = []
        let ref: FIRDatabaseReference! = FIRDatabase.database().reference().child(collection)
        ref.observeSingleEvent(of: .value, with: {(snapshot) -> Void in
            for object in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if let item = FIRDataObject.create(name: className,snapshot: object){
                    print(item, item.value(forKey: "title"))
                    items.append(item)
                }
            }
        })
        return items
    }
    
    open static func update()
    {
        // TODO: Create a function to update collection objects
    }
    
    open static func delete()
    {
        // TODO: Create a function to delete collection objects
    }
}
