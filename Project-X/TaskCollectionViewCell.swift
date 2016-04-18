//
//  TaskCollectionViewCell.swift
//  Project-X
//
//  Created by majeed on 24/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    var task : Task = Task() { didSet{
        
            titleLabel.text = task.Title // + " Works";
            mainImageView.image = UIImage(named: "ui-icon-\(task.Title)")
        //mainImageView.tintColor = App.window.tintColor;
        let percentage : Double = (Double(arc4random_uniform(100)) / 100.0)
            progressIndicator.angle = Int(360 * percentage)
        }}
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //@IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var progressIndicator: KDCircularProgress!
    
}
