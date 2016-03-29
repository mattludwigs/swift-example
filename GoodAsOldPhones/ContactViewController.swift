//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Matthew Ludwigs on 3/25/16.
//  Copyright © 2016 Matthew Ludwigs. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize = CGSizeMake(375, 800)
    }

}
