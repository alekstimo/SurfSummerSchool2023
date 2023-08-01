//
//  MainViewController.swift
//  SurfSummerSchool2023
//
//  Created by Кирилл Зезюков on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        static let height: CGFloat = 30
        static let spaceBetweenElements: CGFloat = 7
        static let spaceBetweenRows: CGFloat = 8
       
    }
    
    private var model: MainModel = .createDefault()
    
    //MARK: - Properties
    @IBOutlet private weak var tittleImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var cityMarkImageView: UIImageView!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavigationBar()
        configureCollectionView()
    }


    

}
private extension MainViewController {
    func configure(){
       if let url = URL(string: model.imageUrlInString) {
           tittleImageView.loadImage(from: url)
        }
        tittleImageView.layer.cornerRadius =  tittleImageView.frame.size.width / 2
        tittleImageView.clipsToBounds = true
        
        fullNameLabel.text = model.fullName
        fullNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textColor = .black
        
        cityLabel.text = model.city
        cityLabel.font = .systemFont(ofSize: 14)
        cityLabel.textColor = UIColor(named: "textColor")
        
        cityMarkImageView.image = UIImage(named: "cityTag")
        
        infoLabel.text = model.info
        infoLabel.font = .systemFont(ofSize: 14)
        infoLabel.textColor = UIColor(named: "textColor")
        
    }
    func configureNavigationBar() {
        navigationItem.title = "Профиль"
        self.view.backgroundColor = UIColor(named: "backgroundColor")
    }
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(SkillsCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(SkillsCollectionViewCell.self)")
        collectionView.register(UINib(nibName: "\(AboutCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(AboutCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
    }
}
// MARK: - UICollection
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SkillsCollectionViewCell.self)", for: indexPath)
            if let cell = cell as? SkillsCollectionViewCell {
                cell.skillsArray = model.skills
                
                }
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AboutCollectionViewCell.self)", for: indexPath)
            if let cell = cell as? AboutCollectionViewCell {
                cell.about = model.about
                
                }
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let itemWidth = CGFloat(skillsArray[indexPath.row].count * Constants.textSize + Constants.freeSpace )
        
        //return CGSize(width: self.collectionView.bounds.width, height: Constants.height)
        return CGSize(width: self.collectionView.bounds.width, height: 100)
    }
   
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenRows
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenElements
//    }
    

}

