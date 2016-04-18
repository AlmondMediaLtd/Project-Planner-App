
//  Created by user on 10/10/2015.
//  Copyright © 2015 Codev. All rights reserved.
//

import UIKit

class NewProjectViewController: UITableViewController, UITextFieldDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.budgetTextBox.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var titleTextBox: UITextField!;
    @IBOutlet weak var dueDateTextBox: UITextField!;
    @IBOutlet weak var budgetTextBox: UITextField!;
    
    var selectedDate : NSDate = NSDate()
    
    @IBAction func dueDateBeganEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.date = selectedDate
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(NewProjectViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dueDateTextBox.text = dateFormatter.stringFromDate(sender.date)
        selectedDate = sender.date
        
    }
    
    @IBAction func budgetTextboxValueChanged(sender: UITextField) {
        let zero = "0"
        if(sender.text?.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding) == 0)
        {
            sender.text = zero
        }
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool { // return NO to not change text
        
        
        if(textField.text?.lengthOfBytesUsingEncoding(NSUnicodeStringEncoding) > 1 && textField.text![0] == "0")
        {
            textField.text?.removeAtIndex(textField.text!.startIndex.advancedBy(0))
        }
        
        
        let newString = textField.text! + string
        
        let array = Array(newString.characters)
        var pointCount = 0 //count the decimal separator
        var unitsCount = 0 //count units
        var decimalCount = 0 // count decimals
        
        for character in array { //counting loop
            if character == "." {
                pointCount += 1
            } else {
                if pointCount == 0 {
                    unitsCount += 1
                } else {
                    decimalCount += 1
                }
            }
        }
        if unitsCount > 18 { return false } // units maximum : here 2 digits
        if decimalCount > 2 { return false } // decimal maximum
        switch string {
        case "0","1","2","3","4","5","6","7","8","9": // allowed characters
            return true
        case ".": // block to one decimal separator to get valid decimal number
            if pointCount > 1 {
                return false
            } else {
                return true
            }
        default: // manage delete key
            let array = Array(string.characters)
            if array.count == 0 {
                return true
            }
            return false
        }
        
        
    }
    
    @IBAction func save(sender: AnyObject) {
        let project = App.CreateProject(titleTextBox.text!, date : selectedDate, budget : Double(budgetTextBox.text!)!, template : App.Memory.selectedTemplate);
        App.Data.Projects.append(project);
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
   

}
