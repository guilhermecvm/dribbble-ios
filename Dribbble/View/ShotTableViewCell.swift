//
//  ShotTableViewCell.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import UIKit
import Alamofire

class ShotTableViewCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var shotTitle: UILabel!
    @IBOutlet weak var shotViews: UILabel!
    
    var shot: Shot? {
        didSet {
            Alamofire.request(.GET, shot!.imageUrl).validate(contentType: ["image/*"]).responseImage() {
                (request, _, image, error) in
                if error == nil && image != nil {
                    self.shotImageView.image = image
                }
            }
            
            self.shotTitle.text = "\(shot!.title)"
            self.shotViews.text = "\(shot!.viewsCount)"
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

}
