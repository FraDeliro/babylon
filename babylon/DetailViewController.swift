//
//  ViewController.swift
//  babylon
//
//  Created by Francesco on 13/01/17.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Outlets & Variables
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerImageView: CuttedImageHeader!
    @IBOutlet weak var openCommentsButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberOfCommentsLabel: UILabel!
    
    var userFullName: String = ""
    var numberOfComments: String = ""
    var postDescription: String = ""

    //MARK: - Page lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI
        self.openCommentsButton.layer.cornerRadius = 22.0
        self.openCommentsButton.layer.zPosition = 1
        self.openCommentsButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.descriptionLabel.textColor = Color.materialDarkText.primary
        self.numberOfCommentsLabel.textColor = Color.materialLightText.primary
        
        self.fillData()
    }
    
    //MARK: - Custom Accessors
    func fillData() {
        self.title = userFullName
        self.descriptionLabel.attributedText = self.justifyLabelText(text: postDescription.capitalized)
        self.numberOfCommentsLabel.text = numberOfComments
    }
    
    func justifyLabelText(text: String) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        let attributedString = NSAttributedString(string: text, attributes: [NSParagraphStyleAttributeName: style, NSBaselineOffsetAttributeName: NSNumber(value: 0)])
        return attributedString
    }
    
}
