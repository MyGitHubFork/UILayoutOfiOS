//
//  firstTableViewController.swift
//  AutoLayout
//
//  Created by yifan on 15/9/6.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//

import UIKit

class firstTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nib = UINib(nibName: "firstTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "firstTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("firstTableViewCell", forIndexPath: indexPath) as! firstTableViewCell
        
        cell.textLabel?.text = indexPath.row.description
        
        return cell
    }
}
