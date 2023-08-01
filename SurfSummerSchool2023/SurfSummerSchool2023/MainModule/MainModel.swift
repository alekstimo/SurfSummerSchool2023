//
//  MainModel.swift
//  SurfSummerSchool2023
//
//  Created by Кирилл Зезюков on 01.08.2023.
//

import Foundation
import UIKit

struct MainModel {
    // MARK: - Internal Properties
    var imageUrlInString: String
    var fullName: String
    var info: String
    var city: String
    var skills: [String]
    var about: String
    
    

        // MARK: - Initialization
    internal init(imageUrlInString: String, fullName: String, info: String, city: String, skills: [String], about: String) {
            self.imageUrlInString = imageUrlInString
            self.fullName = fullName
            self.info = info
        self.city = city
        self.skills = skills
        self.about = about
        }
    
    static func createDefault() -> MainModel {
        .init(
            imageUrlInString: "https://avatars.dzeninfra.ru/get-zen_doc/1637352/pub_5e8a5fa30f9a4d63482b1941_5e8a60bd5fdea526818c1d72/scale_1200",
            fullName: "Тимонова Александра Максимовна",
            info: "Super Mega Ultra iOS developer",
            city: "Воронеж",
            skills: ["Трудолюбие", "Отвага", "Слабоумие","ZaPodedu","я люблю какашки","киткат", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие", "Слабоумие"],
            about: "Люблю котиков и iOS, возьмите меня к себе, пожалуйста!!!")
        }
    
}
