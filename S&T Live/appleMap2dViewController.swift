//
//  appleMap2dViewController.swift
//  S&T Live
//
//  Created by matthew stroble on 11/2/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class appleMap2dViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapTypeSegmentedControll: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    
    private var rootRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
        self.mapTypeSegmentedControll.addTarget(self, action: #selector(mapTypeChanged), for: .valueChanged)
        
        self.rootRef = Database.database().reference()
        let london = MKPointAnnotation()
        london.title = "London"
        london.coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)
        mapView.addAnnotation(london)
        populateCampusEvent()
        
//        print(myVarTest)
        
    }
    
    @objc func mapTypeChanged(segmentedControl :UISegmentedControl) {
        
        switch(segmentedControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = .standard
        case 1:
            self.mapView.mapType = .satellite
        case 2:
            self.mapView.mapType = .hybrid
        default:
            self.mapView.mapType = .standard
        }
    }
    
//    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span:
//            MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
//        mapView.setRegion(region, animated: true)
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }
    
    private func populateCampusEvent() {
            
            let campusEventRef = self.rootRef.child("events")
            
            campusEventRef.observe(.value) { snapshot in
                
                let eventDictionaries = snapshot.value as? [String:Any] ?? [:]
                print("Printing dictionary")
                for (key, _) in eventDictionaries {
                    
                    if let eventDict = eventDictionaries[key] as? [String:Any] {
                        print("eventDic", eventDict)
                        if let campusEvent = CampusEvent(dictionary: eventDict) {
                            print("creating campusEvent")
                            DispatchQueue.main.async {
                                
                                let eventAnnotaion = MKPointAnnotation()
                                eventAnnotaion.title = campusEvent.name
                                eventAnnotaion.coordinate = CLLocationCoordinate2D(latitude: campusEvent.latitude, longitude: campusEvent.longitude)
                                
                                self.mapView.addAnnotation(eventAnnotaion)
                                
                            }
                            
                        }
                        
                    }
                }
                
            }
            
        }
    
}
