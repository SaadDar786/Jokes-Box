//
//  Jokes.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation
import Gloss

class Jokes : Decodable {
    
    var value = [Joke]()
    
    required init?(json: JSON) {
       self.value =  [Joke].from(jsonArray: ("value" <~~ json)!)!;
    }
}
