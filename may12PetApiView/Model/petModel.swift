//
//  PetBreedModal.swift
//  feb19-swiftui-1
//
//  Created by TS2 on 5/5/25.
//

import Foundation
import Foundation

struct PetsContainer: Codable {
    let petss: [PetModel]
}

struct PetModel: Identifiable, Codable {
    let id = UUID()
    let petName: String
    let type: String
    let address: Address
    let yearOfBirth: Int
    let age: Int
    let breed: String
    let activities: [String]
    let image: String
    let distance: String?

    enum CodingKeys: String, CodingKey {
        case petName = "pet_name"
        case type
        case address
        case yearOfBirth = "year_of_birth"
        case age
        case breed
        case activities
        case image
        case distance
    }
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let zip: String?
}


//"pets": [
//        {
//            "pet_name": "BB2",
//            "type": "dog",
//            "address": {
//                "street": "123 Main Street",
//                "city": "Springfield",
//                "state": "Illinois"
//            },
//            "year_of_birth": 2018,
//            "age": 7,
//            "breed": "Golden Retriever",
//            "activities": ["fetch", "swimming", "running"],
//        "image": "dog1bg"
//        },
