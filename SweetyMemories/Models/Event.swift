//
//  Event.swift
//  Landmarks
//
//  Created by Tran Dinh Hoang Huy on 2020/04/14.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An object that models a user profile.
*/
import Foundation

struct Event {
    var id : String
    var eventName : String
    var eventDate : Date
    var type : CountType
    var level : Level
    fileprivate var imageUrl: String
    var notes : String
    
    enum Level: String, CaseIterable {
        case low = "1"
        case medium = "2"
        case high = "3"
    }
    
    enum CountType: String, CaseIterable {
        case up = "1"
        case down = "0"
    }
}
