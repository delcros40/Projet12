//
//  Bdd.swift
//  RunningWith
//
//  Created by DELCROS Jean-baptiste on 07/11/2020.
//  Copyright © 2020 DELCROS Jean-baptiste. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage


class Ref {
    
    let bdd = Database.database().reference()
    let stockage = Storage.storage().reference()
    
    //Database
    var racineUtilisateur: DatabaseReference { return bdd.child("utilisateur")}
    var racineRun: DatabaseReference { return bdd.child("run")}
    
    func utilisateurSpecifique(id: String) -> DatabaseReference {
        return racineUtilisateur.child(id)
    }
    
    func runUtilisateurSpecifique(id: String) -> DatabaseReference {
        return racineRun.child(id)
    }
    
    func runSpecifique(key: String, value: String) -> DatabaseReference {
        return runUtilisateurSpecifique(id: value).child(key)
    }
    
}
