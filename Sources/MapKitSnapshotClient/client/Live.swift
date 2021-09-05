import MapKit

public extension MapKitSnapshotClient {

    static func live(
        coordinates: CLLocationCoordinate2D,
        zoom: Double,
        options: Options
    ) -> Self {
        let mapOptions: MKMapSnapshotter.Options = .init()
        
        mapOptions.region = MKCoordinateRegion(
            center: coordinates,
            latitudinalMeters: zoom,
            longitudinalMeters: zoom
        )

        mapOptions.size = options.size
        mapOptions.mapType = options.mapType
        mapOptions.showsBuildings = options.showBuildings
        mapOptions.pointOfInterestFilter = options.poiFilter

        let snapshotter = MKMapSnapshotter(
            options: mapOptions
        )

        let start: (@escaping MapResult) -> () = { mapResult in
            snapshotter.start(completionHandler: { snapshot, error in
                if let snapshot = snapshot {
                    mapResult(.success(snapshot.image))
                }else{
                    mapResult(.failure(error!))
                }
            })
        }

        return Self(
            start: start,
            cancel: snapshotter.cancel,
            isLoading: { snapshotter.isLoading }
        )
    }
}
