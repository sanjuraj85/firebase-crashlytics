//
//  ViewController.swift
//  firebase-crashlytics
//
//  Created by Pandit, Sanjay on 7/12/18.
//  Copyright © 2018 Pandit, Sanjay. All rights reserved.
//

import UIKit
import Firebase
import Crashlytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Log that the view did load, CLSNSLogv is used here so the log message will be
        // shown in the console output. If CLSLogv is used the message is not shown in
        // the console output.
        CLSNSLogv("%@", getVaList(["View loaded tested by sanjay 1234"]))
        
        Crashlytics.sharedInstance().setIntValue(42, forKey: "MeaningOfLife Sanjay")
        Crashlytics.sharedInstance().setObjectValue("Test value Sanjay ", forKey: "last_UI_action")
        Crashlytics.sharedInstance().setUserIdentifier("123456789")
        
        let userInfo = [
            NSLocalizedDescriptionKey: NSLocalizedString("The request failed. custom", comment: ""),
            NSLocalizedFailureReasonErrorKey: NSLocalizedString("The response returned a 404. custom", comment: "test comment"),
            NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString("Does this page exist?", comment:""),
            "ProductID": "345678",
            "UserID": "Sanjay Pandit"
        ]
        let error = NSError.init(domain: NSURLErrorDomain, code: -1001, userInfo: userInfo)
        Crashlytics.sharedInstance().recordError(error)
    }
    
    @IBAction func initiateCrash(_ sender: AnyObject) {
        // CLSLogv is used here to indicate that the log message
        // will not be shown in the console output. Use CLSNSLogv to have the
        // log message show in the console output.
        // [START log_and_crash_swift]
        CLSLogv("%@", getVaList(["Cause Crash button clicked"]))
        Crashlytics.sharedInstance().crash()
        
        // [END log_and_crash_swift]
    }


}

