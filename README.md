# 🌎 MapKitSnapshotClient

[![Swift 5.3](https://img.shields.io/badge/swift-5.3-ED523F.svg?style=flat)](https://swift.org/download/)

Easy MapKit Snapshot solution

## Usage

Once [installed](#installation), _no additional configuration is required_. You can import the `MapKitSnapshotClient` module and call the `.live()` function.

``` swift
let client: MapKitSnapshotClient = .live(
    coordinates: CLLocationCoordinate2D(latitude: 52.239647, longitude: 21.045845),
    zoom: 500,
    options: Options(
        size: CGSize(width: 100, height: 100)
    )
)
```
You can also use the prebuilt `UIImageView` subclass

``` swift
let imageView = MapImageView()
imageView.start(with: client)
```

or the SwiftUI View too

``` swift
struct Container: View {
    let client: MapKitSnapshotClient

    var body: some View {
        MapImage(client: client)
            .frame(width: 100, height: 100, alignment: .center)
    }
}
```

## Installation

### Swift Package Manager

If you want to use MapKitSnapshotClient in any other project that uses [SwiftPM](https://swift.org/package-manager/), add the package as a dependency in `Package.swift`:

```swift
dependencies: [
  .package(name: "MapKitSnapshotClient", url: "https://github.com/MarcoCarnevali/MapKitSnapshotClient.git", from: "1.0.0"),
]
```
