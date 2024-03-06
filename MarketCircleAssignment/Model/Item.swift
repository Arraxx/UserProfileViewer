//
//  Item.swift
//  MarketCircleAssignment
//
//  Created by Arrax on 05/03/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
