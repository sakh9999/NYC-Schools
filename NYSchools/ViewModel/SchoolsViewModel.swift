//
//  SchoolsViewModel.swift
//  NYSchools
//
//  Created by Vamshi Bussa on 3/7/24.
//

import Foundation


class SchoolsViewModel : ObservableObject{
    
    private var schoolsNetworkhelper : SchoolService
    @Published var schoolModels : [SchoolModel] = []
    @Published var errorMessage : String?
    @Published var isLoading : Bool = false
    
    init(schoolService: SchoolService) {
        self.schoolsNetworkhelper = schoolService
    }
    
    @MainActor
    func getData() async {
        
        isLoading = true
        errorMessage = nil
        do{
            schoolModels = try await schoolsNetworkhelper.getData(url: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
        } catch {
            errorMessage = error.localizedDescription
        }
//        print(self.schoolModels)
        isLoading = false
        
    }
}


