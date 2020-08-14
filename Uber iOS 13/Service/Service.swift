//
//  Service.swift
//  Uber iOS 13
//
//  Created by Stanley Traub on 8/12/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import Firebase
import GeoFire


struct Service {
    
    static let shared = Service()
    
    func fetchUserData(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let uid = snapshot.key
            let user = User(uid: uid, dictionary: dictionary)
            
            print("DEBUG: User email is \(user.email)")
            print("DEBUG: User full is \(user.fullname)")
            
            completion(user)
        }
    }
    
    func fetchDrivers(location: CLLocation, completion: @escaping(User) -> Void) {
        let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        
        REF_DRIVER_LOCATIONS.observe(.value) { snapshot in
            geofire.query(at: location, withRadius: 50).observe(.keyEntered, with: { (uid, location) in
                self.fetchUserData(uid: uid, completion: { user in
                    var driver = user
                    driver.location = location
                    completion(user)
                })
            })
        }
    }
}
