//
//  TaskActivitiesViewController.swift
//  Project-X
//
//  Created by majeed on 24/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class TaskActivitiesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var activitiesTableView: UITableView!
    @IBOutlet weak var assigneeImageView: CircleImageView!
    @IBOutlet weak var assigneeNameLabel: UILabel!
    @IBOutlet weak var taskBudget: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        task = App.Memory.selectedTask!;
        reloadData();
    }
    
    var task : Task = Task()
    
    func reloadData() {
        self.navigationItem.title = task.Title
        let assignee = App.getTaskAssignee(task);
        self.assigneeNameLabel.text = assignee?.Name
        let image = UIImage(named: "ui-image-assignee-\(task.Assignee_Id)")
        self.assigneeImageView.image = image;
        self.taskBudget.text = task.MaxBudget.description
        activitiesTableView.reloadData()
    }
    
    @IBAction func taskMenuTapped(sender: AnyObject) {
        
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        // 2
        let deleteAction = UIAlertAction(title: "Delete Task", style: .Destructive, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        let editAction = UIAlertAction(title: "Edit Task", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            
        })
        
        let assignAction = UIAlertAction(title: "Assign Task", style: .Default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.performSegueWithIdentifier("assignTaskSegue", sender: self)
        })
        
        //
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
            print("Cancelled")
        })
        
        
        // 4
        optionMenu.addAction(assignAction)
        optionMenu.addAction(editAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        // 5
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    @IBAction func phoneAssigneeTapped(sender: AnyObject) {
    }
    @IBAction func messageAssigneeTapped(sender: AnyObject) {
    }
    
    
    
    @IBAction func addActivityTapped(sender: AnyObject) {
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return task.Activities.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = activitiesTableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as! ActivityTableViewCell
        
        
        let activity = task.Activities[indexPath.row];
        
        cell.activity = activity;
        
        return cell
    }

}
