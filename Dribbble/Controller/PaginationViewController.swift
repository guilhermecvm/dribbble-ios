//
//  PaginationViewController.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/22/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import UIKit

protocol PaginationViewControllerDelegate {
    func paginationViewControllerDidGoToPage(page: Int, sender: AnyObject)
}

class PaginationViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    var page = 1
    var delegate: PaginationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nextButton.layer.cornerRadius = self.nextButton.frame.size.width/2
        self.prevButton.layer.cornerRadius = self.prevButton.frame.size.width/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToNext(sender: AnyObject) {
        self.delegate?.paginationViewControllerDidGoToPage(++page, sender: sender)
        
        if (page == 2) {
            self.prevButton.hidden = false
        }
    }
    
    @IBAction func goToPrev(sender: AnyObject) {
        self.delegate?.paginationViewControllerDidGoToPage(--page, sender: sender)
        
        if (page == 1) {
            self.prevButton.hidden = true
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let shotListTableViewController = segue.destinationViewController as ShotListTableViewController
        self.delegate = shotListTableViewController
        shotListTableViewController.getShotsFromPage(page)
    }

}
