//
//  Post.swift
//  CodaGram
//
//  Created by Matthieu PASSEREL on 21/01/2018.
//  Copyright © 2018 Matthieu PASSEREL. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Run {
    
    let ref: DatabaseReference!
    let id: String!
    let titre: String!
    let date: Double!
    let address: String!
    let speed: Double!
    let duration: Double!
    let level: String!
    let creator: User
    let runners: [User]
    
    init(ref: DatabaseReference, id: String, user: User, commentaires: [Commentaire], dict: [String: AnyObject]) {
        self.ref = ref
        self.id = id
        self.creator = user
        self.titre = dict["titre"] as? String ?? ""
        self.date = dict["date"] as? Double ?? 0
        self.address = dict["address"] as? String ?? ""
        self.speed = dict["speed"] as? String ?? ""
        self.duration = dict["duration"] as? String ?? ""
        self.level = dict["level"] as? String ?? ""
        self.runners = dict["runners"] as? [User] ?? []
    }
    
    init(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: AnyObject] else { return }
        self.ref = snapshot.ref
        self.id = snapshot.key
        self.titre = dict["titre"] as? String ?? ""
        self.date = dict["date"] as? Double ?? 0
        self.address = dict["address"] as? String ?? ""
        self.speed = dict["speed"] as? String ?? ""
        self.duration = dict["duration"] as? String ?? ""
        self.level = dict["level"] as? String ?? ""
        self.creator = dict["creator"] as? String ?? ""
        self.runners = dict["runners"] as? [String] ?? []
    }
    
    func toAnyObject() -> Any {
      return [
        "titre": self.titre,
        "date": self.date,
        "address": self.address,
        "speed": self.speed,
        "duration": self.duration,
        "level": self.level,
        "creator": self.creator,
        "runners": self.runners
      ]
    }
}









