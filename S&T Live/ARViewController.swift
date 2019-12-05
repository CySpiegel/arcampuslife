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

//        //custom poi
//        let buttlerhall = buildNode(latitude: 37.955689, longitude: -91.771831, altitude: 236, imageName: "pin")
//        nodes.append(buttlerhall)
        //let havenerCenter = buildViewNode(latitude: 37.954950, longitude: -91.776709, altitude: 320, text: "Havener")
        //nodes.append(havenerCenter)
        
        //let library = buildViewNode(latitude: 37.955652, longitude: -91.773490, altitude: 320, text: "Library")
        //nodes.append(library)
        
        let bchViewNode = buildNodeUI(latitude: 37.9556544, longitude: -91.7717959, altitude: 340, text: "BCH")
        nodes.append(bchViewNode)
            
        let IDE = buildNodeUI(latitude: 37.9539748, longitude: -91.7720439, altitude: 340, text: "IDE")
        nodes.append(IDE)
        
        let library = buildNodeUI(latitude: 37.9555752, longitude: -91.7735239, altitude: 340, text: "Library")
        nodes.append(library)
        
        let norwood = buildNodeUI(latitude: 37.953677, longitude: -91.7728309, altitude: 340, text: "Norwood")
        nodes.append(norwood)
        
        let fulton = buildNodeUI(latitude: 37.9549271, longitude: -91.7730291, altitude: 340, text: "Fulton")
        nodes.append(fulton)
        
        let cs = buildNodeUI(latitude: 37.9559439, longitude: -91.774293, altitude: 340, text: "Computer")
        nodes.append(cs)
        
        let mcnutt = buildNodeUI(latitude: 37.955952, longitude: -91.7761095, altitude: 340, text: "McNutt")
        nodes.append(mcnutt)
        
        let mine = buildNodeUI(latitude: 37.9471219, longitude: -91.7793533, altitude: 340, text: "Mine")
        nodes.append(mine)
        
        let humanitites = buildNodeUI(latitude: 37.9553103, longitude: -91.7742387, altitude: 340, text: "Humanities")
        nodes.append(humanitites)
        
        let schrenk = buildNodeUI(latitude: 37.9528779, longitude: -91.7740627, altitude: 340, text: "Schrenk")
        nodes.append(schrenk)
        
        let toomey = buildNodeUI(latitude: 37.9542786, longitude: -91.7740034, altitude: 340, text: "Toomey")
        nodes.append(toomey)

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
    
    func buildNodeUI(latitude: CLLocationDegrees, longitude: CLLocationDegrees,
                     altitude: CLLocationDistance, text: String) -> LocationAnnotationNode {
        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        //let id = id
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 460))
        myView.backgroundColor = UIColor(white:1, alpha: 1)
        myView.layer.cornerRadius = 40.0
        //myView.allowUserInteraction
        //myView.userInteractionEnabled=YES
        //self.addSubview(myView)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 25))
        label.backgroundColor=UIColor(red: 0, green: 0.2784, blue: 0.0314, alpha: 1.0)
        label.textAlignment = NSTextAlignment.center
        label.text = "Distance: 10m"
        myView.addSubview(label)
        
        let imageName = text
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 25, width: 250, height: 400)
        myView.addSubview(imageView)
        
        return LocationAnnotationNode(location: location, view: myView)
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
