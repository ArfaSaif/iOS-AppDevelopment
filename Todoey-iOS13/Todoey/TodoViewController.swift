//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {

    let todoArray = ["buy eggs", "eat ice cream", "eat fish"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }

    // Provide a cell object for each row.
    // needs a view cell as the return type
    // returned to table view as a row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
        // currently trying to populate the indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: K.prototypeCell, for: indexPath)
       
       // Configure the cell’s contents.
        cell.textLabel!.text = todoArray[indexPath.row]  // current row of the current index path
           
       return cell
    }

}

