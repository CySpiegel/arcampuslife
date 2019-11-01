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

@available(iOS 11.0, *)
class ViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    
    let sceneLocationView = SceneLocationView()
    
    class func loadFromStoryboard() -> ViewController {
        return UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "ARCLViewController") as!
        ViewController
        
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

