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
    ///     DB.create(collection:NAME, object:OBJECT)
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
    /// - parameter collection: the key for the objects needed in Firebase
    /// - parameter className:  class name for the serialized object
    /// - parameter callback:   a function to make use of the results
    ///
    /// Usage:
    ///     DB.read(collection:NAME, className:CLASS, callback: { (data:[AnyObject]) -> Void in
    ///         for object in data as! [CLASS]{
    ///             // do stuff
    ///         }
    ///     })
    ///
    open static func read(collection:String, className:String, callback: @escaping ((_ data:[AnyObject]) -> Void ))
    {
        var objects: [AnyObject] = []
        let ref: FIRDatabaseReference! = FIRDatabase.database().reference().child(collection)
        ref.observeSingleEvent(of: .value, with: {(snapshot) -> Void in
            for object in snapshot.children.allObjects as! [FIRDataSnapshot] {
                let dataObj = FIRDataObject.create(name: className, snapshot: object)
                objects.append(dataObj!)
            }
            
            callback(objects)
        })
    }
    
    
    /// Reads given collection object from Firebase by
    /// the given key and sends a serialized object by 
    /// class name to the callback
    ///
    /// - parameter collection: the key for the object's collection
    /// - parameter className:  class name for the serialized object
    /// - parameter key:        the key for the object
    /// - parameter callback:   a function to make use of the result
    ///
    /// Usage:
    ///     DB.readByKey(collection:NAME, className:CLASS, key:KEY) { (data:AnyObject) -> Void in
    ///         if let object = data as? CLASS{
    ///             // do stuff
    ///         }
    ///     }
    ///
    open static func readByKey(collection:String, className:String, key:String, callback: @escaping ((_ data:AnyObject) -> Void ))
    {
        let ref: FIRDatabaseReference! = FIRDatabase.database().reference().child(collection).child(key)
        ref.observeSingleEvent(of: .value, with: {(snapshot) -> Void in
            let dataObj = FIRDataObject.create(name: className, snapshot: snapshot)
            callback(dataObj!)
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
