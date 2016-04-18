//
//  ActionListViewController.swift
//  Project-X
//
//  Created by majeed on 26/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class ActionListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func accountBtnTapped(sender: AnyObject) {
        self.navigationController!.tabBarController!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil);
    }

}
