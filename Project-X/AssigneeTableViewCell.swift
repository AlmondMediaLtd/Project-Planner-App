//
//  AssigneeTableViewCell.swift
//  Project-X
//
//  Created by majeed on 29/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class AssigneeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let cornerRadius = CGFloat((74.0 - 20.0) / 2.0);
        self.photoImage.layer.cornerRadius = cornerRadius;
        self.photoImage.clipsToBounds = true;
        self.photoImage.layer.borderWidth = 2.0;
        self.photoImage.layer.borderColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.2).CGColor
        self.roleLabel.layer.cornerRadius = 5.0
        self.roleLabel.clipsToBounds = true;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var assignee : Assignee = Assignee() {
        didSet{
            nameLabel.text = assignee.Name
            roleLabel.text = assignee.JobTitle
            photoImage.image = UIImage(named: "ui-image-assignee-\(assignee.Id)") ?? UIImage(named: "ui-image-default-assignee-profile")
        }
    }
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    

}
