//
//  SkillCollectionViewCell.swift
//  SurfSummerSchool2023
//
//  Created by Кирилл Зезюков on 01.08.2023.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

}

private extension SkillCollectionViewCell {
    func configure() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 14)
        self.backgroundColor = UIColor(named: "backgroundColor")
        self.layer.cornerRadius = 12
    }
}
