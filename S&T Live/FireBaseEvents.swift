//
//  FireBaseEvents.swift
//  S&T Live
//
//  Created by matthew stroble on 11/3/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//

import Foundation

struct CampusEvent {
    var Building :String
    var dateEnd :String
    var dateStart :String
    var description :String
    var name :String
    var room :String
    var timeEnds :String
    var timeStarts :String
    var latitude :Double
    var longitude :Double
    
//    func toDictionary() -> [String:Any] {
//        return ["latitude":self.latitude, "longitude":self.longitude]
//   }
}

extension CampusEvent {
    init?(dictionary: [String:Any]) {
        guard let Building = dictionary["building"] as? String,
            let dateEnd = dictionary["dateEnd"] as? String,
            let dateStart = dictionary["dateStart"] as? String,
            let description = dictionary["description"] as? String,
            let nameOfEvent = dictionary["name"] as? String,
            let roomNumber = dictionary["room"] as? String,
            let timeEnds = dictionary["timeEnds"] as? String,
            let timeStarts = dictionary["timeStarts"] as? String,
            let latitude = dictionary["latitude"] as? Double,
            let longitude = dictionary["longitude"] as? Double else {
                print("Something has failed during the creation of dictionary with dictionary \(dictionary)")
                return nil
        }
        
        print("Attempting to create Dictionary")
        self.Building = Building
        self.dateEnd = dateEnd
        self.dateStart = dateStart
        self.description = description
        self.name = nameOfEvent
        self.room = roomNumber
        self.timeEnds = timeEnds
        self.timeStarts = timeStarts
        self.latitude = latitude
        self.longitude = longitude
        
        
    }
}
