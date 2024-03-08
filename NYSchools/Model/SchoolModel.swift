//
//  SchoolModel.swift
//  NYSchools
//
//  Created by Vamshi Bussa on 3/7/24.
//

import Foundation

struct SchoolModel: Decodable, Identifiable{
    
    var id = UUID()
    var schoolName : String
    var website : String
    var paragraph : String
    
    
    enum CodingKeys: String, CodingKey{
        case schoolName = "school_name"
        case paragraph = "overview_paragraph"
        case website
    }
}


