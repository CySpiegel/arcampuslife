//
//  ViewController.swift
//  S&T Live
//
//  Created by matthew stroble on 10/30/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//
import ARCL
import ARKit
import MapKit
import UIKit
import Firebase

@available(iOS 11.0, *)
class ViewController: UIViewController {
    
    private var rootRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.rootRef = Database.database().reference()
        
        
    }
}

