//
// Created by Rodrigo Porto.
// Copyright © 2024 PortoCode. All Rights Reserved.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 404)
}

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}
