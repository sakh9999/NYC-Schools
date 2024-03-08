//
//  SchoolDetailViewTest.swift
//  NYSchoolsUITests
//
//  Created by Vamshi Bussa on 3/7/24.
//

import XCTest

final class SchoolDetailViewTest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["-UITesting"]
        app.launch()
    }
    
    func testSchoolDetailView() throws{
        let app = XCUIApplication()
        app.launch()
        
        app.tables.cells.element(boundBy: 0).tap()
        
        let idText = app.staticTexts["ID: 1"]
        let schoolNametext = app.staticTexts["IName: ABC School"]
        let websiteText = app.staticTexts["Website: www.abcschool.org"]
        let paragraphtext = app.staticTexts["Paragraph: asdkjhasbv zkhvuasy j,zhgdcuys jkgydfiuaw"]
        
        XCTAssertTrue(idText.exists)
        XCTAssertTrue(schoolNametext.exists)
        XCTAssertTrue(websiteText.exists)
        XCTAssertTrue(paragraphtext.exists)
    }
}
