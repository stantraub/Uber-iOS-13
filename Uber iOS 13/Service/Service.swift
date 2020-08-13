//
//  Service.swift
//  Uber iOS 13
//
//  Created by Stanley Traub on 8/12/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import Firebase



struct Service {
    
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    func fetchUserData(completion: @escaping(User) -> Void) {
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            let user = User(dictionary: dictionary)
            
            print("DEBUG: User email is \(user.email)")
            print("DEBUG: User full is \(user.fullname)")
            
            completion(user)
        }
    }
}
