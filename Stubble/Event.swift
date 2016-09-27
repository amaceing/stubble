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
        let titleSnapshot = snapshot.childSnapshot(forPath: "title")
        let eventDescriptionSnapshot = snapshot.childSnapshot(forPath: "eventDescription")
        let eventTypeSnapshot = snapshot.childSnapshot(forPath: "eventType")
        let numTicketsSnapshot = snapshot.childSnapshot(forPath: "numberOfTickets")
        let dateAndTimeSnapShot = snapshot.childSnapshot(forPath: "dateAndTime")
        let askingPriceSnapShot = snapshot.childSnapshot(forPath: "askingPrice")
        self.title = titleSnapshot.value as! String
        self.eventDescription = eventDescriptionSnapshot.value as! String
        self.eventType = EventType.basketball
        self.numberOfTickets = numTicketsSnapshot.value as! Int
        self.dateAndTime = Date()
        self.askingPrice = askingPriceSnapShot.value as! Int
    }
    
    internal func setEventType(type: String) -> EventType {
        let typeOfEvent = type
        var type: EventType!
        switch typeOfEvent {
        case "Basketball":
            type = EventType.basketball
        case "Baseball":
            type = EventType.baseball
        case "Football":
            type = EventType.football
        case "Soccer":
            type = EventType.soccer
        case "Concert":
            type = EventType.concert
        case "Play":
            return EventType.play
        case "Other":
            type = EventType.other
        default:
            print("Invalid event type")
        }
        return type
    }
    
    
    
}
