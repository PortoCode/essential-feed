//
// Created by Rodrigo Porto.
// Copyright © 2025 PortoCode. All Rights Reserved.
//

import Foundation

public class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
