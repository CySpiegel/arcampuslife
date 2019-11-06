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
        
        populateCampusEvent()
    }
    
    private func populateCampusEvent() {
           
           let campusEventRef = self.rootRef.child("events")
           
           campusEventRef.observe(.value) { snapshot in
               
               let eventDictionaries = snapshot.value as? [String:Any] ?? [:]
            print("Printing dictionary")
                print(eventDictionaries)
               for (key, _) in eventDictionaries {
                   
                   if let eventDict = eventDictionaries[key] as? [String:Any] {
                       
                       if let campusEvent = CampusEvent(dictionary: eventDict) {
                           
                           DispatchQueue.main.async {
                               
                               let eventAnnotaion = MKPointAnnotation()
                               eventAnnotaion.coordinate = CLLocationCoordinate2D(latitude: campusEvent.latitude, longitude: campusEvent.longitude)
                               
                               //self.mapView.addAnnotation(floodAnnotation)
                               
                           }
                           
                       }
                       
                   }
               }
               
           }
           
       }
    
    
}

