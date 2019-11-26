//
//  Vehicle.swift
//  SearchView
//
//  Created by Suresh Shiga on 25/11/19.
//  Copyright © 2019 Test. All rights reserved.
//

import Foundation


class Vehicle {
    var name: String
    var image: String
    var checkmark: String
    init(name:String, image:String, checkmark: String) {
        self.name          = name
        self.image         = image
        self.checkmark = checkmark
    }
}


let vehicleArr = [
    Vehicle(name: "karthikeya", image: "karthikeya", checkmark: "No"),
    Vehicle(name: "Mahesh", image: "Mahesh", checkmark: "No"),
    Vehicle(name: "AlluArjun", image: "AlluArjun", checkmark: "No"),
    Vehicle(name: "Naani", image: "Naani", checkmark: "No"),
    Vehicle(name: "Nitin", image: "Nitin", checkmark: "No"),
    Vehicle(name: "Ntr", image: "Ntr", checkmark: "No"),
    Vehicle(name: "Prabhas", image: "Prabhas", checkmark: "No"),
    Vehicle(name: "Ram", image: "Ram", checkmark: "No"),
    Vehicle(name: "Ramcharan", image: "Ramcharan", checkmark: "No"),
    Vehicle(name: "SaiDharamtej", image: "SaiDharamtej", checkmark: "No"),
    Vehicle(name: "Sumanth", image: "Sumanth", checkmark: "No"),
    Vehicle(name: "VijayDevaraKonda", image: "VijayDevaraKonda", checkmark: "No"),
    Vehicle(name: "Sharvanand", image: "Sharvanand", checkmark: "No")]

