//
//  Globals.swift
//  NewsApplication
//
//  Created by macbook on 24/12/20.
//  Copyright © 2020 macbook. All rights reserved.
//

import UIKit

class Globals: NSObject {
    static let shared = Globals()
    static let baseUrl = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=9a0c8e375ada4198a26f7a52638c4b78"
    func getDate(date: String) -> String {
        let dateFormatter = DateFormatter.serverDateFormatter()
        let date = dateFormatter.date(from: date) ?? Date()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: date)
    }

}

