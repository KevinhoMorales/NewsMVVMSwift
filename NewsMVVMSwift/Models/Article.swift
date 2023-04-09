//
//  Article.swift
//  NewsMVVMSwift
//
//  Created by Kevinho Morales on 8/4/23.
//

import Foundation

struct ArticlesResponse: Codable {
  let status: String
  let totalResults: Int
  let articles: [Article]
}

struct Article: Codable {
  let source: Source
  let author: String?
  let title: String
  let description: String
  let url: String
  let urlToImage: String
  let publishedAt: String
  let content: String?
}

struct Source: Codable {
  let id: String?
  let name: String
}
