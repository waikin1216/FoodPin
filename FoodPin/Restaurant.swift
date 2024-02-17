//
//  Restaurant.swift
//  FoodPin
//
//  Created by Wai Kin Ng on 14/2/2024.
//

import Foundation

struct Restaurant{
    var showError: Bool
    var showOption: Bool
    var isFavorite: Bool
    var name:String
    var type:String
    var location:String
    var image:String
    
    init(showError: Bool, showOption: Bool, isFavorite: Bool, name: String, type: String, location: String, image: String) {
        self.showError = showError
        self.showOption = showOption
        self.isFavorite = isFavorite
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        
    }
    init(){
        self.init(showError: false, showOption: false, isFavorite: false, name: "", type: "", location: "", image: "")
    }
//    init(isFavorite: Bool, name: String, type: String, location: String, image: String) {
//        self.isFavorite = isFavorite
//        self.name = name
//        self.type = type
//        self.location = location
//        self.image = image
//    }
//    
//    init(){
//        self.init(isFavorite: false, name: "", type: "", location: "", image: "")
//    }
}
