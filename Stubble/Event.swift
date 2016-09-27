//
//  Event.swift
//  Stubble
//
//  Created by Anthony Mace on 8/21/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import Foundation
import FirebaseDatabase

enum EventType: String {
    case basketball
    case baseball
    case football
    case soccer
    case concert
    case play
    case other
}

class Event: FIRDataObject {
    var title: String = ""
    var eventType: String = EventType.other.rawValue
    var numberOfTickets: Int = 0
    var dateAndTime: Date = Date()
    var askingPrice: Double = 0.00
    var eventDescription: String = ""
}
