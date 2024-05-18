//
// Created by Rodrigo Porto.
// Copyright © 2024 PortoCode. All Rights Reserved.
//

import XCTest

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        // given
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        // when
        sut.load()
        
        // then
        XCTAssertNotNil(client.requestedURL)
    }
    
}
