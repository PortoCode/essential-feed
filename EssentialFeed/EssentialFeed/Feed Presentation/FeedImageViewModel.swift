//
// Created by Rodrigo Porto.
// Copyright © 2025 PortoCode. All Rights Reserved.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
