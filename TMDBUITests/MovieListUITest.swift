//
//  MovieListUITest.swift
//  TMDBUITests
//
//  Created by Ruan Reis on 27/07/20.
//  Copyright © 2020 Ruan Reis. All rights reserved.
//

import XCTest
import KIF

class MovieListUITest: KIFTestCase {
    
    func testScrollThroughPages() {
        tester().waitForView(withAccessibilityLabel: "The Old Guard")
    }
}
