//
//  Access.swift
//  swift-testing
//
//  Created by Rodrigo Cavalcante on 03/03/17.
//  Copyright © 2017 Rodrigo Cavalcante. All rights reserved.
//

import Foundation

struct Access {
    
    let profile: Bool
    let timeline: Bool
    let friends: Bool
    let dashboard: Bool
    
    init(json: JsonObject?) {
        self.profile = json?["profile"] as? Bool ?? false
        self.timeline = json?["timeline"] as? Bool ?? false
        self.friends = json?["friends"] as? Bool ?? false
        self.dashboard = json?["dashboard"] as? Bool ?? false
    }
}
