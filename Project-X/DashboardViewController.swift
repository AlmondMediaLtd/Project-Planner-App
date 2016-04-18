//
//  DashboardViewController.swift
//  Project-X
//
//  Created by majeed on 25/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // self.applyAppBackground();
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //self.applyAppBackground();
    }
    
    @IBAction func accountBtnTapped(sender: AnyObject) {
        self.navigationController!.tabBarController!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil);
    }

}
