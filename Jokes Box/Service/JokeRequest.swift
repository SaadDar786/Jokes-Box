//
//  JokeRequest.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation



class JokeRequest {
    
    var jokesUrl : String?
    var type : JokeType?
    var delegate: JokesViewController?
    
    init(delegate: JokesViewController, type:JokeType) {
        self.delegate = delegate
        self.type = type;
        self.jokesUrl = getJokesUrlWithType(type: type)
    }
    
    
    func getJokesUrlWithType(type: JokeType) -> String {
        var url : String?
        
        switch (type)
        {
        case .Random:
            url = Base_URL + Jokes_URL + Random_URL + Jokes_count
            break
            
        default:
            break
            
        }
        
        return url!
    }
    
}



