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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

