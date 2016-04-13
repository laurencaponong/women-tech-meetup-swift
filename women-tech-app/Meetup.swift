//
//  Meetup.swift
//  women-tech-app
//
//  Created by Caponong, Lauren on 4/13/16.
//  Copyright © 2016 Caponong, Lauren. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class Meetup {
    
    let meetupID: Int?
    let timeOfMeetup: String = ""
    
    required init(json: JSON, id: Int?) {
        self.meetupID = id
    }
    
}