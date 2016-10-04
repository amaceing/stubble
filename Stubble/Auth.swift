//
//  Authentication.swift
//  Stubble
//
//  Created by Dylan Intorf on 10/1/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import Foundation
import Firebase

class Auth{
    var infoPath: String
    var options: FIROptions
    
    var infoDict: NSDictionary { return NSDictionary(contentsOfFile: infoPath)! }
    
    var kGoogleClientID: String { return options.clientID }
    var kFacebookAppID: String { return infoDict.value(forKey: "FacebookAppID") as! String }
    
    init()
    {
        self.options = (FIRApp.defaultApp()?.options)!
        self.infoPath = Bundle.main.path(forResource: "Info", ofType: "plist")!
    }
}
