//
//  ProfileViewController.swift
//  Stubble
//
//  Created by Anthony Mace on 8/20/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cropProfileImageToCircle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cropProfileImageToCircle() {
        self.profileImage.layer.borderWidth = 1
        self.profileImage.layer.masksToBounds = false
        self.profileImage.layer.borderColor = UIColor.gray.cgColor
        self.profileImage.layer.backgroundColor = UIColor.gray.cgColor
        self.profileImage.layer.cornerRadius = self.profileImage.frame.height/2
        self.profileImage.clipsToBounds = true
    }


}

