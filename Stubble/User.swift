//
//  User.swift
//  Stubble
//
//  Created by Anthony Mace on 6/25/17.
//  Copyright © 2017 Mace. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User: FIRDataObject {
    var id: String = ""
    var name: String = ""
    var email: String = ""
    var username: String = ""
    
    override var description: String {
        return "user info: \(id) \(name) \(email) \(username)"
    }
}


