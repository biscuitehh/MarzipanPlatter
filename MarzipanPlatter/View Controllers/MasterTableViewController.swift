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
        
        self.title = "Master View"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BasicTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicTableViewCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = "Look Craig, I can ride my bike with no handle bars!"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: We should use real data instead of taunting Craig Federighi with our non-existent bike skills
        let detailVC = DetailTableViewController.init(style: .grouped)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
