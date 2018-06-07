//
//  MasterTableViewController.swift
//  MarzipanPlatter
//
//  Created by Michael Thomas on 6/6/18.
//  Copyright © 2018 Biscuit Labs. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Table View Controller"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BasicTableViewCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell", for: indexPath)
        cell.textLabel?.text = "Look Craig, I can ride my bike with no handle bars!"
        return cell
    }
    
}
