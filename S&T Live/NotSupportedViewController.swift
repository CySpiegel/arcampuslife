//
//  NotSupportedViewController.swift
//  S&T Live
//
//  Created by matthew stroble on 11/2/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//

import UIKit

class NotSupportedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let label = UILabel()
        label.text = "iOS 13+ Required"
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
