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
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        let safeEmail = email.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value) { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }

    
    public func insertuser(with user : ChatAppUser){
        database.child(user.safeEmail).setValue([
            "first_name" : user.firstName,
            "last_name" : user.lastName,
        ])
    }
}


struct ChatAppUser {
    
    let firstName : String
    let lastName : String
    let emailAddress : String
    var safeEmail : String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
//    let profilePictureUrl : String
    
}
