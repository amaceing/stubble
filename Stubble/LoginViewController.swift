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
import FirebaseAuthUI

class LoginViewController: UIViewController, FIRAuthUIDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var authResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try FIRAuth.auth()?.signOut()
        } catch {
            print("Error signing out")
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let user = FIRAuth.auth()?.currentUser {
            // User is signed in.
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let feedVC = storyboard.instantiateViewController(withIdentifier: "tabBarVC")
            self.present(feedVC, animated: true, completion: nil)
        } else {
            // No user signed in
            let authUI = FIRAuthUI.authUI()
            authUI?.delegate = self
            let authViewController = authUI!.authViewController()
            self.present(authViewController, animated: true, completion: nil)
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
    
    /// Message sent after the sign in process has completed to report the signed in user or
    /// error encountered.
    ///
    /// - parameter authUI: The @c FIRAuthUI instance sending the messsage.
    /// - parameter user:   The signed in user if the sign in attempt was successful.
    /// - parameter error:  The error that occured during sign in, if any.
    ///
    public func authUI(_ authUI: FIRAuthUI, didSignInWith user: FIRUser?, error: Error?) {
        if error == nil {
            let alert = UIAlertController.init(title: "Success", message: user?.email, preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction.init(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(defaultAction)
            alert.present(authUI.authViewController(), animated: true, completion: nil)
            
            authUI.authViewController().dismiss(animated: true, completion: {
            })
        }
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
