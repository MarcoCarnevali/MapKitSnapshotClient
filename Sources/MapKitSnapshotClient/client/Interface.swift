import UIKit
import MapKit

public struct MapKitSnapshotClient {
    public typealias MapResult = (Result<UIImage, Error>) -> ()
    public typealias POIFilter = MKPointOfInterestFilter
    public typealias MapType = MKMapType

    public var start: (@escaping MapResult) -> ()
    public var cancel: () -> ()
    public var isLoading: () -> Bool

    public struct Options {
        var size: CGSize = .zero
        var mapType: MapType = .standard
        var poiFilter: POIFilter = POIFilter()
        var showBuildings: Bool = true
        var zoom: Double = 500

        public init(
            size: CGSize = .zero,
            mapType: MapType = .standard,
            poiFilter: POIFilter = POIFilter(),
            showBuildings: Bool = true,
            zoom: Double = 500
        ) {
            self.size = size
            self.mapType = mapType
            self.poiFilter = poiFilter
            self.showBuildings = showBuildings
            self.zoom = zoom
        }
    }
}

