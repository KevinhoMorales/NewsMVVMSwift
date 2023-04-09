//
//  NewsListTableViewController.swift
//  NewsMVVMSwift
//
//  Created by Kevinho Morales on 8/4/23.
//

import UIKit

final class NewsListTableViewController: UITableViewController {

    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        guard let url = URL(string: Constants.getArticlesAPI) else { return }
        WebServices.shared.getArticles(url: url) { [weak self] articlesResponse in
            guard let articlesResponse else { return }
            self?.articleListViewModel = ArticleListViewModel(articles: articlesResponse.articles)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        articleListViewModel == nil ? 0 : articleListViewModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ARTICLE_CELL_ID", for: indexPath) as? ArticleTableViewCell else { fatalError("ARTICLE_CELL_ID NOT FOUND!") }
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        cell.setUpCell(articleViewModel: articleViewModel)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        let sourceName = "Source Name is \(articleViewModel.sourceName)"
        let alert = UIAlertController(title: sourceName, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.OK, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
