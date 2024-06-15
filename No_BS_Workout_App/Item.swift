//
//  Item.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
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
