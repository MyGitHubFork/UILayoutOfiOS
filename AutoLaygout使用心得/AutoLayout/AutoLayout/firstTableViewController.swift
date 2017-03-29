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
        
        let nib = UINib(nibName: "firstTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "firstTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTableViewCell", for: indexPath) as! firstTableViewCell
        
        cell.textLabel?.text = indexPath.row.description
        
        return cell
    }
}
