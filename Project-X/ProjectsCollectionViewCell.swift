//
//  ProjectsCollectionViewCell.swift
//  Project-X
//
//  Created by majeed on 24/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class ProjectsCollectionViewCell: UICollectionViewCell {
    
    var project : Project =  Project() {
        didSet{
            titleLabel.text = project.Title;
            dueDate.text = UtilityCode.getDateString(project.EndDate, format: "dd MMM yyyy")
            templateImage.image = UIImage(named: "ui-image-\(project.Template.Title)")
        }
    }
    @IBOutlet weak var cardView: CardView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var templateImage: UIImageView!
    
    @IBOutlet weak var menuButton: UIButton!
    
    
}
