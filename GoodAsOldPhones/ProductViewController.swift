//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Matthew Ludwigs on 3/25/16.
//  Copyright © 2016 Matthew Ludwigs. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = product {
            productNameLabel.text = p.name
            
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }
    }

    @IBAction func addToCartPressed(sender: AnyObject) {
        guard let product = product, let name = product.name, let price = product.price else {
            return
        }
        
        
        
        let alertController = UIAlertController(title: "Added To Cart", message: "You Add an \(name) to the cart and it costs $\(price)", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }

}
