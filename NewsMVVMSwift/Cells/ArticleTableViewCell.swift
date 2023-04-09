//
//  ArticleTableViewCell.swift
//  NewsMVVMSwift
//
//  Created by Kevinho Morales on 8/4/23.
//

import UIKit
import Kingfisher

final class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var newImageView: UIImageView!
    
    func setUpCell(articleViewModel: ArticleViewModel) {
        titleLabel.text = articleViewModel.title
        descriptionLabel.text = articleViewModel.description
        let url = URL(string: articleViewModel.urlToImage)
        newImageView.kf.setImage(with: url)
    }
}
