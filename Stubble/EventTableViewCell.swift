//
//  EventTableViewCell.swift
//  Stubble
//
//  Created by Anthony Mace on 9/26/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var titleOfEvent: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var askingPriceOfTicket: UILabel!
    @IBOutlet weak var dateOfEvent: UILabel!
    @IBOutlet weak var timeOfEvent: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
