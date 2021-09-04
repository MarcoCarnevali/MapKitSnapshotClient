import SwiftUI

public struct MapImage: View {
    
    @State private var mapImage: UIImage?
    
    public let client: MapKitSnapshotClient
    public let ended: (() -> Void)?

    public init(client: MapKitSnapshotClient, ended: (() -> Void)? = nil) {
        self.client = client
        self.ended = ended
    }
    
    public var body: some View {
        ZStack {
            if let image = mapImage {
                Image(uiImage: image)
                    .resizable()
            } else if #available(iOS 14.0, *) {
                Rectangle()
                    .redacted(reason: .placeholder)
            } else {
                Rectangle()
                    .fill(Color.secondary)
            }
        }
        .onAppear {
            stopLoading()
            client.start { result in
                switch result {
                case let .success(image):
                    self.mapImage = image
                    ended?()
                case let .failure(error):
                    print("Something went wrong while loading the map snapshot: ", error.localizedDescription)
                    ended?()
                }
            }
        }
        .onDisappear {
            stopLoading()
        }
    }
    
    private func stopLoading() {
        if client.isLoading() {
            client.cancel()
        }
    }
}
