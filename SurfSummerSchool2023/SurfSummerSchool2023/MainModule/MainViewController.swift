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
        static let height: CGFloat = 44
        static let spaceBetweenElements: CGFloat = 12
        static let spaceBetweenRows: CGFloat = 12
        static let textSize: Int = 9
        static let freeSpace: Int = 48
    }
    
    private var model: MainModel = .createDefault()
    private var correctSkillsArray: [String] = []
    var correctState = false
    
    //MARK: - Properties
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet private weak var tittleImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet weak var aboutDescriptionLabel: UILabel!
    @IBOutlet weak var aboutTitleLabel: UILabel!
    @IBOutlet weak var correctSkillsButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
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
    @IBAction func correctSkillsButtonTouched(_ sender: Any) {
        if !correctState {
            correctSkillsButton.setImage(UIImage(named: "done"), for: .normal)
        } else {
            correctSkillsButton.setImage(UIImage(named: "correct"), for: .normal)
        }
        correctState = !correctState
        collectionView.reloadData()
        collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
        self.view.layoutIfNeeded()
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
        
        
        aboutDescriptionLabel.font = .systemFont(ofSize: 14)
        aboutDescriptionLabel.textColor = .black
        aboutDescriptionLabel.text = model.about
        
        aboutTitleLabel.text = "О себе"
        aboutTitleLabel.font = .systemFont(ofSize: 16)
        aboutTitleLabel.textColor = .black
        
        skillsLabel.text = "Мои навыки"
        skillsLabel.font = .systemFont(ofSize: 16)
        skillsLabel.textColor = .black
        
        correctSkillsButton.setImage(UIImage(named: "correct"), for: .normal)
        
        
       // bottomSpaceFromLabelToScrollView.
        
//        collectionView.contentSize = CGSize(width: collectionView.bounds.width, height: CGFloat(model.skills.count * Constants.textSize + Constants.freeSpace))
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Профиль"
        navigationItem.backBarButtonItem?.tintColor  = UIColor(named: "backgroundColor")
        self.view.backgroundColor = UIColor(named: "backgroundColor")
    }
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "\(SkillCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(SkillCollectionViewCell.self)")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
        self.view.layoutIfNeeded()
    }
}
// MARK: - UICollection
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return correctState ? model.skills.count + 1 : model.skills.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SkillCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? SkillCollectionViewCell {
            if indexPath.row < model.skills.count {
                cell.title = model.skills[indexPath.row]
                if correctState {
                    cell.correctionModeOn()
                    cell.deleteButton.addTarget(self, action:  #selector(self.deleteButtonTapped(_:)), for: .touchUpInside)
                    
                } else {
                    cell.correctionModeOff()
                }
            } else {
                cell.title = "+"
            }
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = indexPath.row < model.skills.count ? model.skills[indexPath.row].count : -1
        var itemWidth = CGFloat(count * Constants.textSize + Constants.freeSpace )
        if correctState {
            itemWidth += 24
        }
        if itemWidth > self.view.bounds.width - 32 {
            itemWidth = self.view.bounds.width - 32
        }
        return CGSize(width: itemWidth, height: Constants.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenRows
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.spaceBetweenElements
    }
    @objc func deleteButtonTapped(_ sender: UIButton){
        if let cell = sender.superview as? SkillCollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) {
            
                model.skills.remove(at: indexPath.row)
               collectionView.deleteItems(at: [indexPath])
            //collectionView.heightAnchor.constraint(equalToConstant: CGFloat(CGFloat(model.skills.count + 1) * Constants.height )).isActive = true //TODO: Расчет высоты коллекции ? ОШИБКИ СЫП
            collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
            self.view.layoutIfNeeded()
           }

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row == model.skills.count else {
            return
        }
    
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.default, handler: nil))
        let action = UIAlertAction.init(title: "Добавить", style: .cancel, handler: { [self] action in
            if let textField = alert.textFields?.first, let text = textField.text {
                model.skills.append(text)
                collectionView.reloadData()
                collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
                self.view.layoutIfNeeded()
            }
        })
        alert.addTextField {
            (textField) in textField.placeholder = "Введите название"
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }

}

