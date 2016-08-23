//
//  Event.swift
//  Stubble
//
//  Created by Anthony Mace on 8/21/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import Foundation

enum EventType {
    case Basketball
    case Baseball
    case Football
    case Soccer
    case Concert
    case Play
    case Other
}

class Event: NSObject {
    private var title: String
    private var eventType: EventType
    private var numberOfTickets: Int
    private var dateAndTime: NSDate
    private var askingPrice: Int
    private var eventDescription: String
    
    init(title: String, eventType: EventType, numberOfTickets: Int, dateAndtime: NSDate, askingPrice: Int, eventDesc: String) {
        self.title = title
        self.eventType = eventType
        self.numberOfTickets = numberOfTickets
        self.dateAndTime = dateAndtime
        self.askingPrice = askingPrice
        self.eventDescription = eventDesc
    }
}
