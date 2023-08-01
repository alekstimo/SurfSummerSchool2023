//
//  AboutCollectionViewCell.swift
//  SurfSummerSchool2023
//
//  Created by Кирилл Зезюков on 01.08.2023.
//

import UIKit

class AboutCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var aboutLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var about: String = "" {
        didSet {
            aboutLabel.text = about
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

}

private extension AboutCollectionViewCell {
    func configure() {
        aboutLabel.font = .systemFont(ofSize: 14)
        aboutLabel.textColor = .black
        
        titleLabel.text = "О себе"
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .black
    }
}
