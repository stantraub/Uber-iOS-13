//
//  User.swift
//  Uber iOS 13
//
//  Created by Stanley Traub on 8/12/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import CoreLocation

struct User {
    let fullname: String
    let email: String
    let accountType: Int
    var location: CLLocation?
    let uid: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
        self.uid = uid
     }
}
