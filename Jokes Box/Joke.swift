//
//  Joke.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation
import Gloss

class Joke: Glossy {
    
    let joke : String?
    let jokeId : Int?
    
    // MARK: - Deserialization
    
    required init?(json: JSON) {
        self.joke = "joke" <~~ json
        self.jokeId = "id" <~~ json
    }
    
    // MARK: - Serialization
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.jokeId,
            "joke" ~~> self.joke
            ])
    }
    
}


