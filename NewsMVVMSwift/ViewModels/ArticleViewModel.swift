//
//  ArticleViewModel.swift
//  NewsMVVMSwift
//
//  Created by Kevinho Morales on 8/4/23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSection: Int {
        1
    }
    func numberOfRowsInSection(_ section: Int) -> Int {
        articles.count
    }
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        let articleViewModel = ArticleViewModel(article)
        return articleViewModel
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        article.title
    }
    var description: String {
        article.description
    }
    var urlToImage: String {
        article.urlToImage
    }
    var sourceName: String {
        article.source.name
    }
}
