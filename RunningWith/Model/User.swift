

import Foundation
import Firebase

struct User {
    
    var ref: DatabaseReference
    var id: String
    var email: String
    var username: String
    var nom: String
    var prenom: String
    var imageUrl: String
    
//    init(authData: Firebase.User) {
//        self.id = authData.uid
//        self.email = authData.email!
//    }
//
//    init(uid: String, email: String) {
//        self.id = uid
//        self.email = email
//    }
    
    init(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: AnyObject] else { return }
        self.ref = snapshot.ref
        self.id = snapshot.key
        self.username = dict["username"] as? String ?? ""
        self.prenom = dict["prenom"] as? String ?? ""
        self.nom = dict["nom"] as? String ?? ""
        self.imageUrl = dict["imageUrl"] as? String ?? ""
    }
}

func toAnyObject() -> Any {
  return [
    "name": name,
    "addedByUser": addedByUser,
    "completed": completed
  ]
}
