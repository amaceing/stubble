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
    @IBOutlet weak var userImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cropProfileImageToCircle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cropProfileImageToCircle() {
        self.userImage.layer.borderWidth = 1
        self.userImage.layer.masksToBounds = false
        self.userImage.layer.borderColor = UIColor.gray.cgColor
        self.userImage.layer.backgroundColor = UIColor.gray.cgColor
        self.userImage.layer.cornerRadius = 22
        //self.userImage.clipsToBounds = true
    }

}
