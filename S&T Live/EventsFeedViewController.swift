//
//  EventsFeedViewController.swift
//  S&T Live
//
//  Created by matthew stroble on 12/3/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

class eventsFeedViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblEventFeed: UITableView!
    
    var eventList = [CampusEvent]()
    
    private let locationManager = CLLocationManager()
    
    private var refEvents: DatabaseReference!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let event: CampusEvent
        
        event = eventList[indexPath.row]
        cell.lblEventName.text = event.name
        cell.lblLocation.text = event.Building
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refEvents = Database.database().reference().child("events")
        refEvents!.observe(.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.eventList.removeAll()
                
                for events in snapshot.children.allObjects as![DataSnapshot] {
                    let eventObject = events.value as? [String: AnyObject]
                    
                    let location = eventObject?["building"]
                    let dateEnd = eventObject?["dateEnd"]
                    let dateStart = eventObject?["dateStart"]
                    let description = eventObject?["description"]
                    let nameOfEvent = eventObject?["name"]
                    let roomNumber = eventObject?["room"]
                    let timeEnds = eventObject?["timeEnds"]
                    let timeStarts = eventObject?["timeStarts"]
                    let latitude = eventObject?["latitude"]
                    let longitude = eventObject?["longitude"]

                    let event = CampusEvent(Building: location as! String, dateEnd: dateEnd as! String, dateStart: dateStart as! String, description: description as! String, name: nameOfEvent as! String, room: roomNumber as! String, timeEnds: timeEnds as! String, timeStarts: timeStarts as! String, latitude: latitude as! Double, longitude: longitude as! Double)
                    
                    self.eventList.append(event)
                }
            }
            
            self.tblEventFeed.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    
}


