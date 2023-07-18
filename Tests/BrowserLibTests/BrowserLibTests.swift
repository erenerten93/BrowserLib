import XCTest
@testable import BrowserLib

final class BrowserLibTests: XCTestCase {
    
    
    func testListOrganizations() {
        let browserLib = BrowserLib()

        let expectation = XCTestExpectation(description: "List organizations")

        browserLib.fetchData(from: .getOrganizationList) { (result: Result<[OrganizationData], APIError>) in
            switch result {
            case .success(let organizations):
                // Assert the organization count is greater than 0
                XCTAssertGreaterThan(organizations.count, 0, "Organizations count should be greater than 0")

                // Fulfill the expectation since the success case is executed
                expectation.fulfill()

            case .failure(let error):
                // In the failure case, we should not get an error, so fail the test
                XCTFail("Received error: \(error)")
            }
        }

        // Wait for the expectation to be fulfilled
        wait(for: [expectation], timeout: 5.0)
    }
}
