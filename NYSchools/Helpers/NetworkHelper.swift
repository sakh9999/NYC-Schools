//
//  NetworkHelper.swift
//  NYSchools
//
//  Created by Vamshi Bussa on 3/7/24.
//

import Foundation

class NetworkHelper: SchoolService{
    
    func getData(url : String) async throws -> [SchoolModel] {
        
        guard let dataURL = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: dataURL)
        let schools = try JSONDecoder().decode([SchoolModel].self, from: data)
        
        return schools
    }
}

protocol SchoolService{
    func getData(url : String) async throws -> [SchoolModel]
}
