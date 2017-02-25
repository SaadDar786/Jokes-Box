//
//  JokesService.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation
import Alamofire
import Gloss



class JokeService {
    
    var requestObj : JokeRequest?
    
    init(request:JokeRequest) {
        self.requestObj = request
    }
    
    
    func dispatchRequest(){
        
        Alamofire.request((requestObj?.jokesUrl)!)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                case .success:
                    self.requestObj?.delegate? .jokesServiceSuccess(jokes:Jokes(json: response.value as! JSON)!)
                case .failure(let error):
                     self.requestObj?.delegate? .jokesServiceFailure(errorReason: error.localizedDescription)
                }
        }
        
    }
    
}
