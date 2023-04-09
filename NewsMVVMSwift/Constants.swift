//
//  Constants.swift
//  NewsMVVMSwift
//
//  Created by Kevinho Morales on 8/4/23.
//

import Foundation

struct Constants {
    static let API = "265311f60f924d58bc49ae9818c5a3b5"
    static let getArticlesAPI: String = {
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(Constants.API)"
    }()
    static let OK = "OK"
}
