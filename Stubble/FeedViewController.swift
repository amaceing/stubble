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
    fileprivate var events: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addEvent(_ sender: AnyObject) {
        var eventToAdd = Event(title: "", eventType: EventType.other, numberOfTickets: 0, dateAndtime: Date(), askingPrice: 0, eventDesc: "")
        let newEventVC = NewEventViewController(nibName: "NewEventViewController", bundle: nil)
        newEventVC.eventToCreate = eventToAdd
        self.navigationController?.pushViewController(newEventVC, animated: true)
        self.events.append(newEventVC.eventToCreate!)
    }
    
    //MARK: Table View Implementation
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        //implement later
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //implement later
        return events.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        //implement later
        return 1
    }

//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        //implement later
//    }
    
    
}

