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
    
    
    /// Inserts a new object for the given collection
    /// in Firebase and returns the key
    ///
    /// - parameter collection: the key for the items being inserted to in Firebase
    /// - parameter object:     the object that is being inserted to Firebase
    ///
    /// - returns: the key of the inserted object
    ///
    /// Usage:
    ///     DB.create(collection: "events",object: event)
    ///
    open static func create(collection: String, object: NSObject) -> String
    {
        do {
            let ref: FIRDatabaseReference! = FIRDatabase.database().reference()
            let key = ref.child(collection).childByAutoId().key
            try ref.updateChildValues(["/\(collection)/\(key)":JSONSerializer.toDictionary(JSONSerializer.toJson(object))])
            return key
        } catch {
            print("Error adding to \(collection)")
        }
        return ""
    }
    
    
    /// Reads given collection from Firebase and 
    /// sends array of serialized objects by class name to 
    /// the callback
    ///
    /// - parameter collection: the key for the items needed in Firebase
    /// - parameter className:  class name for the serialized object
    /// - parameter callback:   a function to make use of the results
    ///
    /// Usage:
    ///     DB.read(collection:NAME, className:CLASS, callback: { (data:[AnyObject]) -> Void in
    ///         for item in data as! [CLASS]{
    ///             // do stuff
    ///         }
    ///     })
    ///
    open static func read(collection: String, className: String, callback: @escaping ((_ data:[AnyObject]) ->Void ))
    {
        var items: [AnyObject] = []
        let ref: FIRDatabaseReference! = FIRDatabase.database().reference().child(collection)
        ref.observeSingleEvent(of: .value, with: {(snapshot) -> Void in
            for object in snapshot.children.allObjects as! [FIRDataSnapshot] {
                if let item = FIRDataObject.create(name: className,snapshot: object) {
                    print(item, item.value(forKey: "title"))
                    items.append(item)
                }
            }
            
            callback(items)
        })
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
