//
//  ShotTableViewCell.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import UIKit
import Haneke

class ShotTableViewCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var shotTitle: UILabel!
    @IBOutlet weak var shotViews: UILabel!
    
    var shot: Shot? {
        didSet {
            shotImageView.hnk_setImageFromURL(NSURL(string: shot!.imageUrl)!)
            
            shotTitle.text = "\(shot!.title)"
            shotViews.text = "\(shot!.likesCount)"
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        shotImageView.image = nil
    }

}
