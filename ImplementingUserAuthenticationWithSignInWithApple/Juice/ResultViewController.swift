/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Main application view controller.
*/

import UIKit
import AuthenticationServices

class ResultViewController: UIViewController {
    
    @IBOutlet weak var userIdentifierLabel: UILabel!
    @IBOutlet weak var givenNameLabel: UILabel!
    @IBOutlet weak var familyNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    
    var test = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdentifierLabel.text = KeychainItem.currentUserIdentifier
        
        refreshView()

    }
    func refreshView()
    {
        //all the code goes here
        userIdentifierLabel.text = KeychainItem.currentUserIdentifier
        
        print("init")
        print(test)
    }
    // 
    // 
    
    func OnAppBecameActive()
    {
    // Add logic here to check if need to call refresh view method
        refreshView()
        givenNameLabel.text = test
        print("test:" )
        print(givenNameLabel.text)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("xd vision")
        print(givenNameLabel.text!)
    }
    
    
    
    @IBAction func signOutButtonPressed() {
        // For the purpose of this demo app, delete the user identifier that was previously stored in the keychain.
        KeychainItem.deleteUserIdentifierFromKeychain()
        
        // Clear the user interface.
        userIdentifierLabel.text = ""
//        givenNameLabel.text = ""
//        familyNameLabel.text = ""
//        emailLabel.text = ""
        
        // Display the login controller again.
        DispatchQueue.main.async {
            self.showLoginViewController()
        }
    }
}
