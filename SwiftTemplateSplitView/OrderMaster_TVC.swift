//
//  OrderMaster_TVC.swift
//  SwiftTemplateSplitView
//
//  Created by Frank Cipolla on 2/5/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class OrderMaster_TVC: UITableViewController, Menu_TVC_Delegate { // This is a dynamic table and requires data source methods

    // MARK: Properties
    
    var detailViewController: Menu_TVC? = nil
    
    var orderList: [String] = [] // used at first for testing ["a","b","c","d"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController { // see pg 352 for splitViewController array description
            let controlllers = split.viewControllers
            let dNavController = controlllers[controlllers.count - 1] as! UINavigationController
            detailViewController = dNavController.topViewController as? Menu_TVC
        }
        detailViewController?.delegate = self
  
    }

    // MARK: TableView Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = orderList[indexPath.row]
        if indexPath.row % 2 == 1 {
            // Alternating row backgrounds
            cell.backgroundColor = UIColor.yellow
        } else {
            cell.backgroundColor = tableView.backgroundColor
        }
        return cell
    }
    
    // MARK: Delegate Functions
    
    func didSelectMenuItem(order: String) {  // This delegate is run from the Menu_TVC row selection
        orderList.append(order)
        tableView.reloadData()
    }
    
    // MARK: Manage Resources
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
