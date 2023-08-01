//
//  SkillsCollectionViewCell.swift
//  SurfSummerSchool2023
//
//  Created by Кирилл Зезюков on 01.08.2023.
//

import UIKit

//state for correct button?
class SkillsCollectionViewCell: UICollectionViewCell {

    // MARK: - Constants
    private enum Constants {
        static let height: CGFloat = 30
        static let spaceBetweenElements: CGFloat = 16
        static let spaceBetweenRows: CGFloat = 16
        static let textSize: Int = 6
        static let freeSpace: Int = 66
    }
    //MARK: - UIView
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    //MARK: - Properties
    var skillsArray: [String] = []
    var correctState = false
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        configureCollectionView()
    }
    @IBAction func correctSkillsButtonTouched(_ sender: Any) {
        if !correctState {
            correctButton.setImage(UIImage(named: "done"), for: .normal)
        } else {
            correctButton.setImage(UIImage(named: "correct"), for: .normal)
        }
        correctState = !correctState
        
    }
    
}

private extension SkillsCollectionViewCell {
    func configure(){
        titleLabel.text = "Мои навыки"
        titleLabel.font = .systemFont(ofSize: 16)
        titleLabel.textColor = .black
        
        correctButton.setImage(UIImage(named: "correct"), for: .normal)
    }
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(SkillCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(SkillCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        //collectionView.contentInset = .init(top: 10, left: 16, bottom: 10, right: 16)
    }
}

// MARK: - UICollection
extension SkillsCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SkillCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? SkillCollectionViewCell {
            cell.title = skillsArray[indexPath.row]
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = CGFloat(skillsArray[indexPath.row].count * Constants.textSize + Constants.freeSpace )
        return CGSize(width: itemWidth, height: Constants.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    

}

