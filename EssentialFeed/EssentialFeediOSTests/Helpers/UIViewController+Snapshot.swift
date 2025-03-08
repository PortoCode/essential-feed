//
// Created by Rodrigo Porto.
// Copyright © 2025 PortoCode. All Rights Reserved.
//

import UIKit


extension UIViewController {
    func snapshot(for configuration: SnapshotConfiguration) -> UIImage {
        return SnapshotWindow(configuration: configuration, root: self).snapshot()
    }
}

struct SnapshotConfiguration {
    let size: CGSize
    let safeAreaInsets: UIEdgeInsets
    let layoutMargins: UIEdgeInsets
    let traitCollection: UITraitCollection
    
    static func iPhone15(style: UIUserInterfaceStyle) -> SnapshotConfiguration {
        return SnapshotConfiguration(
            size: CGSize(width: 393, height: 852),
            safeAreaInsets: UIEdgeInsets(top: 59, left: 0, bottom: 34, right: 0),
            layoutMargins: UIEdgeInsets(top: 59, left: 16, bottom: 34, right: 16),
            traitCollection: UITraitCollection {
                $0.forceTouchCapability = .unavailable
                $0.layoutDirection = .leftToRight
                $0.preferredContentSizeCategory = .medium
                $0.userInterfaceIdiom = .phone
                $0.horizontalSizeClass = .compact
                $0.verticalSizeClass = .regular
                $0.displayScale = 3
                $0.displayGamut = .P3
                $0.userInterfaceStyle = style
            }
        )
    }
}

private final class SnapshotWindow: UIWindow {
    private var configuration: SnapshotConfiguration = .iPhone15(style: .light)
    
    convenience init(configuration: SnapshotConfiguration, root: UIViewController) {
        self.init(frame: CGRect(origin: .zero, size: configuration.size))
        self.configuration = configuration
        self.layoutMargins = configuration.layoutMargins
        self.rootViewController = root
        self.isHidden = false
        root.view.layoutMargins = configuration.layoutMargins
    }
    
    override var safeAreaInsets: UIEdgeInsets {
        return configuration.safeAreaInsets
    }
    
    override var traitCollection: UITraitCollection {
        return super.traitCollection.modifyingTraits { traits in
            traits.forceTouchCapability = configuration.traitCollection.forceTouchCapability
            traits.layoutDirection = configuration.traitCollection.layoutDirection
            traits.preferredContentSizeCategory = configuration.traitCollection.preferredContentSizeCategory
            traits.userInterfaceIdiom = configuration.traitCollection.userInterfaceIdiom
            traits.horizontalSizeClass = configuration.traitCollection.horizontalSizeClass
            traits.verticalSizeClass = configuration.traitCollection.verticalSizeClass
            traits.displayScale = configuration.traitCollection.displayScale
            traits.displayGamut = configuration.traitCollection.displayGamut
            traits.userInterfaceStyle = configuration.traitCollection.userInterfaceStyle
        }
    }
    
    func snapshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds, format: .init(for: traitCollection))
        return renderer.image { action in
            layer.render(in: action.cgContext)
        }
    }
}
