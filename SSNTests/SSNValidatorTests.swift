//
//  SSNTests.swift
//  SSNTests
//
//  Created by Gabriela on 21/02/21.
//  Copyright © 2021 Gabriela Olson. All rights reserved.
//

import XCTest
import Foundation
import UIKit
@testable import SSN
var sut: SSNValidator!


class SSNValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SSNValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testRandomSSN() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let result = sut.randomSSN(length: 9)
        XCTAssert(result.count == 9)
        

        
    }
    
    func testIsValidNumber () throws {
        var validNumber = sut.isValidSSN ("145890321")
        XCTAssert(validNumber)

    }
    
    func testIsValidNumberNegative() throws{
        
        var invalidNumber = sut.isValidSSN("000666678")
        XCTAssert(invalidNumber == false)
    }



}
