import XCTest
import SwiftUI
import SnapshotTesting
@testable import MapKitSnapshotClient

final class MapKitSnapshotClientTests: XCTestCase {
    func testSnapshot() {

        let wait = expectation(description: "wait map generation")

        let client: MapKitSnapshotClient = .demo(
            options: MapKitSnapshotClient.Options(
                size: CGSize(width: 100, height: 100)
            )
        )

        client.start { result in

            defer {
                wait.fulfill()
            }

            switch result {
            case let .success(image):
                assertSnapshot(matching: image, as: .image)
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }

        waitForExpectations(timeout: 1.5, handler: nil)
    }

    func testImageView() {
        let size = CGSize(width: 100, height: 100)
        let wait = expectation(description: "wait map generation")

        let client: MapKitSnapshotClient = .demo(
            options: MapKitSnapshotClient.Options(
                size: size
            )
        )

        let imageView = MapImageView()
        imageView.frame = CGRect(origin: .zero, size: size)
        imageView.start(with: client) {
            wait.fulfill()
        }

        waitForExpectations(timeout: 1.5, handler: nil)
        assertSnapshot(matching: imageView, as: .image)
    }
}
