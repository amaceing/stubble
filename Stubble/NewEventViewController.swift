
//
//  NewEventViewController.swift
//  Stubble
//
//  Created by Anthony Mace on 9/4/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var ticketsField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var askingPriceField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    var eventToCreate: Event?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("viewInit")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.titleField.delegate = self
        self.typeField.delegate = self
        self.ticketsField.delegate = self
        self.timeField.delegate = self
        self.askingPriceField.delegate = self
        self.descriptionField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        eventToCreate?.title = titleField.text!
        eventToCreate?.eventType = setEventType()
        eventToCreate?.numberOfTickets = Int(ticketsField.text!)!
        eventToCreate?.askingPrice = Double(askingPriceField.text!)!
    }
    
    func setEventType() -> String {
        let typeOfEvent = typeField.text!
        var type: String!
        switch typeOfEvent {
        case "Basketball":
            type = EventType.basketball.rawValue
        case "Baseball":
            type = EventType.baseball.rawValue
        case "Football":
            type = EventType.football.rawValue
        case "Soccer":
            type = EventType.soccer.rawValue
        case "Concert":
            type = EventType.concert.rawValue
        case "Play":
            return EventType.play.rawValue
        case "Other":
            type = EventType.other.rawValue
        default:
            print("Invalid event type")
        }
        return type
    }
    
    @IBAction func createEvent(_ sender: UIButton) {
        let title: String = self.titleField.text!
        let type = setEventType()
        let tickets = self.ticketsField.text!
        let time = self.timeField.text!
        let askingPrice = self.askingPriceField.text!
        let description = self.descriptionField.text!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let eventDate = formatter.date(from: time)
        let event = Event(dict: ["title": title, "eventType": type, "numberOfTickets": Int(tickets)!, "dateAndTime": eventDate!, "askingPrice": Double(askingPrice)!, "eventDescription": description])
        
        let eventId = DB.create(collection: "events",object: event)
        print("Event: \(eventId)")
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
