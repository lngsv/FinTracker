//
//  Item.swift
//  FinanceTracking
//
//  Created by Alan Gasiev on 2024-08-22.
//

import Foundation
import SwiftData

@Model
final class Item {
    var date: Date
    var score: Int
    var order: Int

    init(date: Date, score: Int, order: Int = 0) {
        self.date = date
        self.score = score
        self.order = order
    }
}
