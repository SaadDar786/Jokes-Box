//
//  JokesDelegate.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation

protocol JokesDelegate {
   
    func jokesServiceSuccess(jokes:Jokes)
    func jokesServiceFailure(errorReason:String)
}

