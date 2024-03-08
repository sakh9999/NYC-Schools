//
//  SchoolViewModel.swift
//  NYSchoolsTests
//
//  Created by Vamshi Bussa on 3/7/24.
//

import XCTest

final class SchoolViewModelTests: XCTestCase {
    
    var viewModel : SchoolsViewModel!
    var apiNetworkHelper : MockNetworkhelper!

    override func setUp() async throws {
        try await super.setUp()
        apiNetworkHelper = MockNetworkhelper()
        viewModel = SchoolsViewModel(schoolService : MockNetworkhelper())
    }
    
    override func tearDown() {
        viewModel = nil
        apiNetworkHelper = nil
        super.tearDown()
    }

    
    func testGetSchoolsSuccess() async {
        apiNetworkHelper.mockSchools = [SchoolModel(schoolName: "ABC School", website: "www.abcschool.org", paragraph: "asdfg werty hjfgj kjahkj kjasicuabk kjahdouad"), SchoolModel(schoolName: "DEF School", website: "www.defschool.org", paragraph: "asdfg werty hjfgj kjahkj kjasicuabk kjahdouad"), SchoolModel(schoolName: "mno School", website: "www.mnoschool.org", paragraph: "asdfg werty hjfgj kjahkj kjasicuabk kjahdouad"), SchoolModel(schoolName: "XYZ School", website: "www.xyzschool.org", paragraph: "asdfg werty hjfgj kjahkj kjasicuabk kjahdouad")]
        
        await viewModel.getData()
        
        XCTAssertEqual(viewModel.schoolModels.count, 4)
        XCTAssertEqual(viewModel.schoolModels.first?.schoolName, "ABC School")
    }
    
    func testGetSchoolFailure() async{
        
        apiNetworkHelper.fetchFailed = true
        await viewModel.getData()
        
        XCTAssertNotNil(viewModel.errorMessage)
    }
    


}

class MockNetworkhelper : SchoolService{
    
    var mockSchools : [SchoolModel] = []
    var fetchFailed = false
    
     func getData(url: String) async throws -> [SchoolModel] {
        if fetchFailed{
            throw NSError(domain: "", code: -1, userInfo: nil)
        }
        return mockSchools
    }
    
}
