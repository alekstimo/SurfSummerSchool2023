//
//  SkillCollectionViewCell.swift
//  SurfSummerSchool2023
//
//  Created by Кирилл Зезюков on 01.08.2023.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    var deleteButton: UIButton!
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        title = ""
        correctionModeOff()
    }
    func correctionModeOn() {
        deleteButton = UIButton(frame: CGRect(x: self.frame.width - 24, y: titleLabel.frame.minY + 2, width: 14, height: 14))
        deleteButton.setImage(UIImage(named: "delete"), for: .normal)
        
        self.addSubview(deleteButton)
    }
    func correctionModeOff(){
        if let button = deleteButton {
            button.removeFromSuperview()
        }
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
