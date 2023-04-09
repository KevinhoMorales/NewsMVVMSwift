//
//  WebServices.swift
//  NewsMVVMSwift
//
//  Created by Kevinho Morales on 8/4/23.
//

import Foundation

final class WebServices {
    static let shared: WebServices = {
        WebServices()
    }()
    
    private init() {}
    
    func getArticles(url: URL, completion: @escaping(ArticlesResponse?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print("Error is -> \(error.localizedDescription)")
                completion(nil)
            }
            if let data {
                do {
                    let articlesResponse = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                    completion(articlesResponse)
                } catch(let dataError){
                    print("Data error is -> \(dataError)")
                }
            }
        }.resume()
    }
}
