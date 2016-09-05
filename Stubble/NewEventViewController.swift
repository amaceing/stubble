
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
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
        
        print("viewLoad")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        eventToCreate?.title = titleField.text!
        eventToCreate?.eventType = setEventType()
        eventToCreate?.numberOfTickets = Int(ticketsField.text!)!
        eventToCreate?.askingPrice = Int(askingPriceField.text!)!
    }
    
    func setEventType() -> EventType {
        let typeOfEvent = typeField.text!
        var type: EventType!
        switch typeOfEvent {
        case "BasketBall":
            type = EventType.Basketball
        case "BaseBall":
            type = EventType.Baseball
        case "Football":
            type = EventType.Football
        case "Soccer":
            type = EventType.Soccer
        case "Concert":
            type = EventType.Concert
        case "Play":
            return EventType.Play
        case "Other":
            type = EventType.Other
        default:
            print("Invalid event type")
        }
        return type
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
