//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Matthew Ludwigs on 3/27/16.
//  Copyright © 2016 Matthew Ludwigs. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    var ordersInCart: [Order]?
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let product = Product()
        product.name = "1907 Wall Set"
        product.productImage = "phone-fullscreen1"
        product.cellImage = "image-cell1"
        product.price = 59.99

        let order = Order()
        order.product = product
        
        ordersInCart = [order]
        
        updateTotal()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersInCart?.count ?? 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)
        
        let order = ordersInCart?[indexPath.row]
        
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }

        return cell
    }

    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            updateTotal()
        }
    }
    
    func updateTotal() {
        if let orders = ordersInCart {
            var total: Double = 0.0
            
            for order in orders {
                if let price = order.product?.price {
                    total = total + price
                }
            }
            totalLabel.text = String(total)
        }
    }

}
