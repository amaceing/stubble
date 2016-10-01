//
//  FeedViewController.swift
//  Stubble
//
//  Created by Anthony Mace on 8/20/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit
import FirebaseDatabaseUI
import FirebaseDatabase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var feed: UITableView!
    @IBOutlet weak var stubble: UILabel!
    fileprivate var dataSource = FirebaseTableViewDataSource()
    fileprivate let ref = FIRDatabase.database().reference().child("events")
    fileprivate var eventCount: UInt?
    fileprivate var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.self.dataSource = FirebaseTableViewDataSource(ref: ref, cellReuseIdentifier: "events", view: self.feed)
        self.feed.dataSource = self
        self.feed.delegate = self
        DB.read(collection: "events", className: "Event", callback: { (data:[AnyObject]) -> Void in
            if (self.events.count == 0) {
                self.events = data as! [Event]
            } else {
                let newEvent = data[data.count - 1] as! Event
                self.events.append(newEvent)
            }
            self.feed.reloadData()
        })
        
//        self.ref.observe(.value, with: {(snapshot) -> Void in
//            for event in snapshot.children {
//                let eventToAdd = Event(event as! FIRDataSnapshot)
//                self.events.append(eventToAdd)
//            }
//            self.feed.reloadData()
//        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View Implementation
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //implement later
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //implement later
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //implement later
        return 134
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        return view
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //implement later
        let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as! EventTableViewCell
        let event = events[indexPath.section]
        cell.titleOfEvent?.text = event.title
        cell.eventLocation.text = event.eventDescription
        cell.askingPriceOfTicket.text = "$" + String(event.askingPrice)
        let dateComponents = getDateAndTime(from: event)
        cell.dateOfEvent.text = dateComponents.0
        cell.timeOfEvent.text = dateComponents.1
        return cell
    }
    
    func getDateAndTime(from: Event) -> (String, String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, H:mm a"
        let eventDateStr = dateFormatter.string(from: from.dateAndTime)
        let dateAndTime = eventDateStr.characters.split(separator: ",")
        return (String(dateAndTime[0]), String(dateAndTime[1]))
    }
    
}

