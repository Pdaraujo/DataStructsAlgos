import XCTest
@testable import DataStructuresAndAlgos

final class CurrencyRoutesTests: XCTestCase {

    private var stub: CurrencyRoutes!

    override func setUp() {

        super.setUp()

        self.stub = CurrencyRoutes()
    }

    override func tearDown() {

        self.stub = nil

        super.tearDown()
    }

    func testWithSmallAmountOfRates() throws {

        let pair = "USDRUB"
        let rates: [String: Decimal] = ["GBPRUB": 100, "GBPEUR": 1.1, "USDGBP": 0.7, "EURRUB": 150]
        let timeout: Double = 2.0 //seconds

        let start = CFAbsoluteTimeGetCurrent()
        let result = self.stub.findRateAndRoute(for: pair, rates: rates)
        let execTime = CFAbsoluteTimeGetCurrent() - start

        let expectedRate: Decimal = 0.7 * 100
        let expectedRoute = "USDGBPRUB"

        XCTAssertEqual(result.rate, expectedRate)
        XCTAssertEqual(result.route, expectedRoute)
        XCTAssert(execTime < timeout)
    }

    func testWithDefaultAmountOfRates() throws {

        let pair = "NPRPHP"
        let rates: [String: Decimal] = ["CUCTZS": 2309.4526, "MURTZS": 52.6165, "TZSPHP": 0.0222, "THBCUC": 0.0301, "MURBTN": 1.7129, "NPRMUR": 0.3649, "BTNTHB": 0.4421]
        let timeout: Double = 2.0 //seconds

        let start = CFAbsoluteTimeGetCurrent()
        let result = self.stub.findRateAndRoute(for: pair, rates: rates)
        let execTime = CFAbsoluteTimeGetCurrent() - start

        let expectedRate: Decimal = 0.3649 * 52.6165 * 0.0222
        let expectedRoute = "NPRMURTZSPHP"

        XCTAssertEqual(result.rate, expectedRate)
        XCTAssertEqual(result.route, expectedRoute)
        XCTAssert(execTime < timeout)
    }
}
