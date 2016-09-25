//
//  Event.swift
//  Stubble
//
//  Created by Anthony Mace on 8/21/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum EventType {
    case basketball
    case baseball
    case football
    case soccer
    case concert
    case play
    case other
}

class Event: NSObject {
    var title: String
    var eventType: EventType
    var numberOfTickets: Int
    var dateAndTime: Date
    var askingPrice: Int
    var eventDescription: String
    
    init(title: String, eventType: EventType, numberOfTickets: Int, dateAndtime: Date, askingPrice: Int, eventDesc: String) {
        self.title = title
        self.eventType = eventType
        self.numberOfTickets = numberOfTickets
        self.dateAndTime = dateAndtime
        self.askingPrice = askingPrice
        self.eventDescription = eventDesc
    }
    
    init(snapshot: FIRDataSnapshot) {
        print(snapshot)
        let titleSnapshot = snapshot.childSnapshot(forPath: "title")
        self.title = titleSnapshot.value as! String
        self.eventType = EventType.basketball
        self.numberOfTickets = 4
        self.dateAndTime = Date()
        self.askingPrice = 20
        self.eventDescription = snapshot.value(forKey: "description") as! String
    }
    
    
    
}
