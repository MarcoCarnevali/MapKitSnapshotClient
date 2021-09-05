import MapKit

public extension MapKitSnapshotClient {
    static func demo(options: Options) -> Self {
        .live(
            coordinates: CLLocationCoordinate2D(latitude: 52.239647, longitude: 21.045845),
            zoom: 500,
            options: options
        )
    }
}
