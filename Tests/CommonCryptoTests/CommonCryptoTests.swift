import XCTest
@testable import CommonCrypto

class CommonCryptoTests: XCTestCase {
    func testExample() {
        let str = "a"
        let key = "key"
        let sha = str.sha256(with: key)
        print(sha)
    }


    static var allTests : [(String, (CommonCryptoTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
