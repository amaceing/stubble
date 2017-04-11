//
//  LoginViewController.swift
//  Stubble
//
//  Created by Anthony Mace on 9/4/16.
//  Copyright © 2016 Mace. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var authResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            print(FIRAuth.auth()?.currentUser?.email)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let feedVC = storyboard.instantiateViewController(withIdentifier: "tabBarVC")
            self.present(feedVC, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createUser(_ sender: AnyObject) {
        FIRAuth.auth()?.createUser(withEmail: username.text!, password: password.text!, completion: {
            (user, error) in
            if error != nil {
                self.authResult.text = error?.localizedDescription
            } else {
                self.authResult.text = "Sign up succesful!"
            }
        })
    }

    @IBAction func logUserIn(_ sender: AnyObject) {
        FIRAuth.auth()?.signIn(withEmail: username.text!, password: password.text!, completion: {
            (user, error) in
            if error != nil {
                self.authResult.text = error?.localizedDescription
                print(error?.localizedDescription)
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let feedVC = storyboard.instantiateViewController(withIdentifier: "tabBarVC")
                self.present(feedVC, animated: true, completion: nil)
            }
        })
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
