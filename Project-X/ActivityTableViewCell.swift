//
//  ActivityTableViewCell.swift
//  Project-X
//
//  Created by majeed on 26/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        completedSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var activity : Activity = Activity() { didSet {
        UpdateUI();
        }}
    
    
    @IBOutlet weak var statusColorView: UIView!
    @IBOutlet weak var dueDaysLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var completedSwitch: UISwitch!

    @IBOutlet weak var doneIconImage: UIImageView!
    @IBOutlet weak var dueStaticLabel: UILabel!
    @IBOutlet weak var daysStaticLabel: UILabel!
    
    func UpdateUI()
    {
        
        dueDaysLabel.text = activity.DueInDays.description
        titleLabel.text = activity.Title;
        costLabel.text = UtilityCode.numToCurrency(activity.Cost);
        completedSwitch.hidden = true;
        
        dueStaticLabel.text = "DUE IN";
        daysStaticLabel.text = "DAYS";
        
        if(activity.DueInDays < 0)
        {
            statusColorView.backgroundColor = UIColor(red: 0.86, green: 0.25, blue: 0.22, alpha: 1.0)
            dueStaticLabel.text = "OVERDUE";
            dueDaysLabel.text = (activity.DueInDays * -1).description
            daysStaticLabel.text = activity.DueInDays < -1 ? "DAYS AGO" : "DAY AGO" ;
        }
        else if( activity.DueInDays == 0)
        {
            statusColorView.backgroundColor = UIColor(red: 0.95, green: 0.73, blue: 0.07, alpha: 1.0)
            dueStaticLabel.text = "DUE";
            dueDaysLabel.text = "!";
            daysStaticLabel.text = "TODAY";
        }
        else
        {
            statusColorView.backgroundColor = UIColor.whiteColor();
            daysStaticLabel.text = activity.DueInDays > 1 ? "DAYS" : "DAY";
        }
        
        if(activity.IsCompleted == true)
        {
            statusColorView.backgroundColor = UIColor(red: 0.32, green: 0.65, blue: 0.33, alpha: 1.0)
            
            dueDaysLabel.hidden = true;
            dueStaticLabel.hidden = true;
            daysStaticLabel.hidden = true;
            doneIconImage.hidden = false;
        }
        else{
            dueDaysLabel.hidden = false;
            dueStaticLabel.hidden = false;
            daysStaticLabel.hidden = false;
            doneIconImage.hidden = true;
            completedSwitch.hidden = false;
        }

    }
    
    @IBAction func completedSwitchValueChanged(sender: UISwitch) {
        if(sender.on == true)
        {
            activity.CompletionDate = NSDate();
            activity.IsCompleted = true;
            UpdateUI();
            
        }
    }
    
}
