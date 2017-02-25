//
//  JokesFacade.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation

class JokesFacade {
    
    func getRandomJokesWithCountWithDelegate(delegate:JokesViewController){
        
        let request = JokeRequest(delegate: delegate, type: .Random)
        let service = JokeService(request: request)
        service.dispatchRequest()
        
    }
    
}
