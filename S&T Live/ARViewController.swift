//
//  ARViewController.swift
//  S&T Live
//
//  Created by matthew stroble on 11/2/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//

import UIKit
import ARKit
import ARCL
import MapKit
import Firebase

class ARViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    
    let sceneLocationView = SceneLocationView()
    
    var userAnnotation: MKPointAnnotation?
    
    var updateUserLocationTimer: Timer?
    let displayDebugging = false
    let adjustNorthByTappingSidesOfScreen = false
    
    class func loadFromStoryboard() -> ARViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ARCLViewController") as! ARViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sceneLocationView.showAxesNode = false
        sceneLocationView.arViewDelegate = self
        addSceneModels()
        contentView.addSubview(sceneLocationView)
        sceneLocationView.frame = contentView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        restartAnimation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        print(#function)
        pauseAnimation()
        super.viewWillDisappear(animated)
    }

    func pauseAnimation() {
        print("pause")
        sceneLocationView.pause()
    }

    func restartAnimation() {
        print("run")
        sceneLocationView.run()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sceneLocationView.frame = contentView.bounds
    }
    
}


//MARK: - Implemtation
@available(iOS 13.0, *)
extension ARViewController {
    func addSceneModels() {
        guard sceneLocationView.sceneLocationManager.currentLocation != nil else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.addSceneModels()
            }
            return
        }

        let box = SCNBox(width: 1, height: 0.2, length: 5, chamferRadius: 0.25)
        box.firstMaterial?.diffuse.contents = UIColor.gray.withAlphaComponent(0.5)
        buildBuildings().forEach {
            sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: $0)
        }
        
        sceneLocationView.autoenablesDefaultLighting = true

    }

    func buildBuildings() -> [LocationAnnotationNode] {
        var nodes: [LocationAnnotationNode] = []

//        let spaceNeedle = buildNode(latitude: 47.6205, longitude: -122.3493, altitude: 225, imageName: "pin")
//        nodes.append(spaceNeedle)
//
//        let empireStateBuilding = buildNode(latitude: 40.7484, longitude: -73.9857, altitude: 14.3, imageName: "pin")
//        nodes.append(empireStateBuilding)
//
//        let canaryWharf = buildNode(latitude: 51.504607, longitude: -0.019592, altitude: 236, imageName: "pin")
//        nodes.append(canaryWharf)
//
//        let applePark = buildViewNode(latitude: 37.334807, longitude: -122.009076, altitude: 100, text: "Apple Park")
//        nodes.append(applePark)
//
//
//        //custom poi
//        let buttlerhall = buildNode(latitude: 37.955689, longitude: -91.771831, altitude: 236, imageName: "pin")
//        nodes.append(buttlerhall)
        let havenerCenter = buildViewNode(latitude: 37.954950, longitude: -91.776709, altitude: 320, text: "Havener")
        nodes.append(havenerCenter)
        
        let library = buildViewNode(latitude: 37.955652, longitude: -91.773490, altitude: 320, text: "Library")
        nodes.append(library)
        
        let bchViewNode = buildViewNode(latitude: 37.955689, longitude: -91.771831, altitude: 320, text: "BCH")
        nodes.append(bchViewNode)

        return nodes
    }

    @objc
    func updateUserLocation() {
        guard let currentLocation = sceneLocationView.sceneLocationManager.currentLocation else {
            return
        }

        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {
                return
            }

           
            UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: {
                self.userAnnotation?.coordinate = currentLocation.coordinate
            }, completion: nil)

        }
    }

    func buildNode(latitude: CLLocationDegrees, longitude: CLLocationDegrees,
                   altitude: CLLocationDistance, imageName: String) -> LocationAnnotationNode {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let image = UIImage(named: imageName)!
        return LocationAnnotationNode(location: location, image: image)
    }

    func buildViewNode(latitude: CLLocationDegrees, longitude: CLLocationDegrees,
                       altitude: CLLocationDistance, text: String) -> LocationAnnotationNode {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = text
        label.backgroundColor = .green
        label.textAlignment = .center
        return LocationAnnotationNode(location: location, view: label)
    }
}

// MARK: - Helpers

extension DispatchQueue {
    func asyncAfter(timeInterval: TimeInterval, execute: @escaping () -> Void) {
        self.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(timeInterval * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: execute)
    }
}

extension UIView {
    func recursiveSubviews() -> [UIView] {
        var recursiveSubviews = self.subviews

        subviews.forEach { recursiveSubviews.append(contentsOf: $0.recursiveSubviews()) }

        return recursiveSubviews
    }
}
