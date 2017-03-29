//
//  ViewController.swift
//  WatchConnectivityTest
//
//  Created by Akshay Iyer on 3/28/17.
//  Copyright © 2017 akshaytiyer. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    @available(iOS 9.3, *)
    public func sessionDidDeactivate(_ session: WCSession) {
    }

    @available(iOS 9.3, *)
    public func sessionDidBecomeInactive(_ session: WCSession) {
    }

    @available(iOS 9.3, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }


    var session: WCSession!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(WCSession.isSupported())
        {
            self.session = WCSession.default()
            self.session.delegate = self
            self.session.activate()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMessagetoWatch(_ sender: Any) {
        //Send messages to the watch
        session.sendMessage(["a" : "Hello"], replyHandler: nil, errorHandler: nil)
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        //Handle Messages from the watch
        self.messageLabel.text = message["b"]! as? String
    }
}

