//
//  FeedViewController.swift
//  Stubble
//
//  Created by Anthony Mace on 8/20/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var feed: UITableView!
    @IBOutlet weak var stubble: UILabel!
    private var events: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addEvent(sender: AnyObject) {
        var eventToAdd = Event(title: "", eventType: EventType.Other, numberOfTickets: 0, dateAndtime: NSDate(), askingPrice: 0, eventDesc: "")
        
        
        
    }
    
    //MARK: Table View Implementation
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //implement later
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //implement later
        return events.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //implement later
        return 1
    }

//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        //implement later
//    }
    
    
}

