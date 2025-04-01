//
// Created by Rodrigo Porto.
// Copyright © 2025 PortoCode. All Rights Reserved.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
