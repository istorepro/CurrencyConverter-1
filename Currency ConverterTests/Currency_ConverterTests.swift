//
//  Currency_ConverterTests.swift
//  Currency ConverterTests
//
//  Created by Daniel Baldwin on 7/30/16.
//  Copyright © 2016 Daniel Baldwin. All rights reserved.
//

import XCTest

class Currency_ConverterTests: XCTestCase {
    
    var viewController: ViewController?
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as? ViewController
    }

    func testLabelValuesCorrect() {
        
        guard let viewControllerToTest = viewController else { return }
        guard let exchangeRates = ExchangeRates(pounds:0.75324, euro:0.89342, yen:101.6, reais:3.2653) else { return }
        
        viewControllerToTest.populateLabels(exchangeRates, dollars:100)
        
        XCTAssert(viewControllerToTest.poundsLabel.text == "75.32", "poundsLabel text is incorrect")
        XCTAssert(viewControllerToTest.euroLabel.text == "89.24", "euroLabel text is incorrect")
        XCTAssert(viewControllerToTest.yenLabel.text == "10160.00", "yenLabel text is incorrect")
        XCTAssert(viewControllerToTest.reaisLabel.text == "326.53", "reaisLabel text is incorrect")
    }
    
}
