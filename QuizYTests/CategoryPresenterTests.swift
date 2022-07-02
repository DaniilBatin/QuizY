//
//  QuizYTests.swift
//  QuizYTests
//
//  Created by Daniil Batin on 23.05.2022.
//

import XCTest
@testable import QuizY

class CategoryPresenterTests: XCTestCase {

    var sut: CategoryPresenterProvider!
    override func setUp() {
       super.setUp()
       sut = CategoryPresenter()
    }
    

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testEmptyFilterArray() {
        //Given
        XCTAssertTrue(sut.filterArray.isEmpty)
        XCTAssertEqual(sut.count, 0)
    }
    
    func testCreateFilterArray() {
        //Given
        let testArray:[CategoryType] = [CategoryType.stockSymbols, CategoryType.museums]
        
        //When
        sut.createFilterArray(testArray)
        
        //Then
        XCTAssertEqual(testArray.count, sut.count)
        XCTAssertEqual(testArray, sut.filterArray)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
