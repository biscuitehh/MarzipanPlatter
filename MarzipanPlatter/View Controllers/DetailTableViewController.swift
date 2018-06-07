//
//  DetailTableViewController.swift
//  MarzipanPlatter
//
//  Created by Michael Thomas on 6/7/18.
//  Copyright © 2018 Biscuit Labs. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detail View"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailTableCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = "🤪 This is w-i-l-d 😻"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Section 1️⃣"
        case 1:
            return "Section 2️⃣"
        case 2:
            return "Section 3️⃣"
        default:
            return ""
        }
    }
}
