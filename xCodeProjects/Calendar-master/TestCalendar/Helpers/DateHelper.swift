//
//  DateHelper.swift
//  TestCalendar
//
//  Created by Madison Kaori Shino on 9/18/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)

extension Date {
    
    func formatDate() -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
