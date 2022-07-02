//
//  QuestionPresenterTests.swift
//  QuizYTests
//
//  Created by Daniil Batin on 02.07.2022.
//

import XCTest
@testable import QuizY

class QuestionPresenterTests: XCTestCase {
    
    var sut: QuestionPresenter!
    var view: QuestionViewMock!
    override func setUp() {
        super.setUp()
        view = QuestionViewMock()
        sut = QuestionPresenter(.movies)
        sut.view = view
    }

    override func tearDown() {
        super.tearDown()
        view = nil
        sut = nil

    }

    func testCorrectlyTimerWork() {
        sut.startTimer()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.view.isUpdateTriggedTimer)
        }
     
    }
    
    func testCorrectlyOnLoadNetworkData() {
        //Given
        let expectation = expectation(description: "Completed Data")
        
        //When
        sut.onLoad()
        NetworkService.shared.getCategory(id: 223) { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        
        //Then
        XCTAssertNotNil(sut.currentQuestion)
    }

    func testAlertWork() {
        //Given
        let question = QuestionModel(answer: "12", question: "How many years?")
        let currentQuestion = CurrentQuestionModel(question)
        
        //When
        sut.currentQuestion = currentQuestion
        sut.createAlertWithAnswer()
        
        //Then
        XCTAssertTrue(view.isUpdateTriggedAlert)
    
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
