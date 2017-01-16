//
//  PostTableViewCell.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    //MARK: - Outlets & Variables
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var cardView: MaterialCardView!
    private let readMore = "Read More ..."

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let mutableString = NSMutableAttributedString(attributedString: titleLabel.attributedText!)
        if self.isSelected {
            cardView.backgroundColor = Color.materialDeepPurple.lighten1
            titleLabel.textColor = Color.white
            _ = mutableString.setReadMore(textToFind: readMore, newTextColor: Color.white)
            titleLabel.attributedText = mutableString
        } else {
            cardView.backgroundColor = Color.white
            titleLabel.textColor = Color.materialDarkText.primary
            _ = mutableString.setReadMore(textToFind: readMore, newTextColor: Color.materialRed.darken1)
            titleLabel.attributedText = mutableString
        }
    }

    //MARK: - Custom Accessors
    func configureWithPost(_ post: Post) {
        postImageView.image = #imageLiteral(resourceName: "londra")
        titleLabel.textColor = Color.materialDarkText.primary
        let attributedTitle = NSMutableAttributedString(string: post.title.capitalized + "\r\r" + readMore)
        _ = attributedTitle.setReadMore(textToFind: readMore, newTextColor: Color.materialRed.darken1)
        titleLabel.attributedText = attributedTitle
    }
}

