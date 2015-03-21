//
//  ShotDetailViewController.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import UIKit
import Alamofire

class ShotDetailViewController: UIViewController {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var shotTitle: UILabel!
    @IBOutlet weak var shotViews: UILabel!
    @IBOutlet weak var shotDescription: UITextView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    var shot: Shot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, shot!.imageUrl).validate(contentType: ["image/*"]).responseImage() {
            (request, _, image, error) in
            if error == nil && image != nil {
                self.shotImageView.image = image
            }
        }
        
        Alamofire.request(.GET, shot!.player.avatarUrl).validate(contentType: ["image/*"]).responseImage() {
            (request, _, image, error) in
            if error == nil && image != nil {
                self.playerImageView.image = image
            }
        }
        
        self.playerImageView.layer.cornerRadius = self.playerImageView.frame.size.width/2
        self.playerImageView.clipsToBounds = true
        
        self.shotTitle.text = shot!.title
        self.shotViews.text = "\(shot!.viewsCount)"
        self.shotDescription.text = shot!.desc.html2String
        self.playerName.text = shot!.player.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
