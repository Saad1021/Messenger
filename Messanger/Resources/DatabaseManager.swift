//
//  DatabaseManager.swift
//  Messanger
//
//  Created by Saad Suleman on 10/11/2024.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database  = Database.database().reference()
    
}

// MARK: - Accounnt Managment
/// inserts user to database
extension DatabaseManager{
    
    public func userExists(wth email:String, completiton : @escaping ((Bool) -> Void)) {
        database.child(email).observeSingleEvent(of: .value) { snapshot in
            guard  snapshot.value as? String != nil else {
                completiton(false)
                return
            }
            completiton(true)
        }
    }
    
    public func insertuser(with user : ChatAppUser){
        database.child(user.emailAddress).setValue([
            "first_name" : user.firstName,
            "last_name" : user.lastName,
        ])
    }

    
}


struct ChatAppUser {
    
    let firstName : String
    let lastName : String
    let emailAddress : String
//    let profilePictureUrl : String
    
}
