//
//  ViewController.swift
//  PermissionScope-example
//
//  Created by Nick O'Neill on 4/5/15.
//  Copyright (c) 2015 That Thing in Swift. All rights reserved.
//

import UIKit
import PermissionScope

class ViewController: UIViewController {
    let singlePscope = PermissionScope()
    let multiPscope = PermissionScope()
    let noUIPscope = PermissionScope()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        singlePscope.addPermission(NotificationsPermission(notificationCategories: nil),
            message: "We use this to send you\r\nspam and love notes")

        multiPscope.addPermission(NotificationsPermission(notificationCategories: nil),
            message: "We use this to send you\r\nspam and love notes")

        // Other example permissions
//        multiPscope.addPermission(MicrophonePermission(),message: "We can hear you")
//        multiPscope.addPermission(BluetoothPermission(), message: "We use this to drain your battery")

        noUIPscope.addPermission(NotificationsPermission(notificationCategories: nil), message: "notifications")
        noUIPscope.onAuthChange = {
            (finished, results) in
            print("auth change",finished,results)
        }
    }
    
    
    @IBAction func singlePerm() {
        singlePscope.show(
            { finished, results in
                print("got results \(results)")
            },
            cancelled: { results in
                print("thing was cancelled")
            }
        )
    }
    
    @IBAction func multiPerms() {
        multiPscope.show(
            { finished, results in
                print("got results \(results)")
            },
            cancelled: { results in
                print("thing was cancelled")
            }
        )
    }

    @IBAction func noUIPerm() {
        noUIPscope.requestNotifications()
    }
}

