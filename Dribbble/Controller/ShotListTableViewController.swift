//
//  ShotListTableViewController.swift
//  Dribbble
//
//  Created by Guilherme Miranda on 3/21/15.
//  Copyright (c) 2015 Guilherme Miranda. All rights reserved.
//

import UIKit

class ShotListTableViewController: UITableViewController {
    
    var shots = [Shot]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DribbbleAPI.getPopularShots(1, callback: { (shots, error) -> Void in
            self.shots = shots
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shots.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as ShotTableViewCell
        
        let shot = shots[indexPath.row]
        
        cell.shot = shot

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let shotDetailViewController = segue.destinationViewController as ShotDetailViewController
        shotDetailViewController.shot = (sender as ShotTableViewCell).shot
    }
}
