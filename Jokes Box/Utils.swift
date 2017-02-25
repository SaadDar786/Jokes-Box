//
//  Utils.swift
//  Jokes Box
//
//  Created by saad dar on 2/12/17.
//  Copyright © 2017 Magic Minds. All rights reserved.
//

import Foundation

enum JokeType : Int {
    case Random = 1, CATEGORY
}

class Utils {
    
    static func isObjectNotNil(object:AnyObject!) -> Bool
    {
        if let _:AnyObject = object
        {
            return true
        }
        
        return false
    }
}
