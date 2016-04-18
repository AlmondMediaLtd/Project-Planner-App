//
//  NewActivityViewController.swift
//  Project-X
//
//  Created by majeed on 10/04/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class NewActivityViewController: UIViewController, UITextFieldDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.costTextBox.amount = 0;
        self.costTextBox.currencyNumberFormatter = UtilityCode.getCurrencyFormatter()
        
        selectedDate = NSDate().tommorrow
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dueDateTextBox.text = dateFormatter.stringFromDate(selectedDate)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.dismissKeyboard();
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var titleTextBox: UITextField!;
    @IBOutlet weak var dueDateTextBox: UITextField!;
    @IBOutlet weak var costTextBox: TSCurrencyTextField!;
    
    let dateFormatter = NSDateFormatter()
    var selectedDate : NSDate = NSDate().tommorrow
    
    @IBAction func dueDateBeganEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.date = selectedDate
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(NewProjectViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        selectedDate = sender.date
        dueDateTextBox.text = dateFormatter.stringFromDate(selectedDate)
    }
    
    
    @IBAction func costTextboxValueChanged(sender: UITextField) {
        
    }
    
    @IBAction func save(sender: AnyObject) {
        let activity = App.CreateActivity(titleTextBox.text!, date : selectedDate, cost : Double(costTextBox.amount), template : nil);
        App.Memory.selectedTask?.Activities.append(activity);
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    
}
