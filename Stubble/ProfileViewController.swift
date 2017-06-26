//
//  ProfileViewController.swift
//  Stubble
//
//  Created by Anthony Mace on 8/20/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    let picker = UIImagePickerController()
    let storage = FIRStorage.storage()
    let user = FIRAuth.auth()?.currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cropProfileImageToCircle()
        picker.delegate = self
        self.loadUserPhoto()
        self.loadUserInformation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cropProfileImageToCircle() {
        self.profileImage.layer.borderWidth = 1
        self.profileImage.layer.masksToBounds = false
        self.profileImage.layer.borderColor = UIColor.clear.cgColor
        self.profileImage.layer.cornerRadius = 100
        self.profileImage.clipsToBounds = true
    }
    
    func loadUserPhoto() {
        let image = storage.reference(withPath: "\(self.user!.uid)image.jpg")
        image.data(withMaxSize: 10 * 1024 * 1024, completion: {data, error in
            if error != nil {
                // Uh-oh, an error occurred!
                print("ERROR: \(String(describing: error?.localizedDescription))")
            } else {
                // Data for "images/island.jpg" is returned
                self.profileImage.image = UIImage(data: data!)
            }
        })
    }
    
    func loadUserInformation() {
        DB.readByKey(collection: "users", className: "User", key: self.user?.uid ?? "not set", callback: {(data: Any) -> Void in
            let userInfo = data as! User
            self.nameLabel.text = userInfo.name
            self.usernameLabel.text = userInfo.username
            self.emailLabel.text = userInfo.email
        })
    }

    @IBAction func changeImage(_ sender: UIButton) {
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.profileImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        self.saveUserImage(userImage: self.profileImage.image!)
    }
    
    func saveUserImage(userImage: UIImage) {
        var data = Data()
        data = UIImageJPEGRepresentation(userImage, 1.0)!
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpeg"
        
        let storageRef = storage.reference()
        let userImageFileName = user!.uid + "image.jpg"
        let userImageRef = storageRef.child(userImageFileName)
        userImageRef.put(data, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                print("THIS IS AN ERROR \(String(describing: error?.localizedDescription))!")
                return
            }
            // Metadata contains file metadata such as size, content-type, and download URL.
            let downloadURL = metadata.downloadURL
            print(downloadURL)
        }
    }

    @IBAction func saveUserInformation(_ sender: Any) {
        let name = self.nameInput.text
        let email = self.emailInput.text
        let username = self.usernameInput.text
        print("\(String(describing: name)) \(String(describing: email)) \(String(describing: username))")
        let user = User(dict: ["id": (self.user?.uid)!, "name": name!, "email": email!, "username": username!])
        DB.create(collection: "users", withPath: (self.user?.uid)!, object: user)
    }
}

