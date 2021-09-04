import UIKit

public class MapImageView: UIImageView {

    private var client: MapKitSnapshotClient?

    public func start(with client: MapKitSnapshotClient, ended: (() -> Void)? = nil) {
        stopLoading()
        self.client = client
        self.client?.start { result in
            switch result {
            case let .success(image):
                self.image = image
                ended?()
            case let .failure(error):
                print("Something went wrong while loading the map snapshot: ", error.localizedDescription)
                ended?()
            }
        }
    }

    deinit {
        stopLoading()
    }

    private func stopLoading() {
        if let client = client,
           client.isLoading() {
            client.cancel()
        }
    }

    public init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    public override init(image: UIImage?) {
        super.init(image: image)
    }

    @available(*, unavailable)
    public override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
