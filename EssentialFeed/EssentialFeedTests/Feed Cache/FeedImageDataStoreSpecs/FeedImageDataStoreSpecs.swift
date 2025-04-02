//
// Created by Rodrigo Porto.
// Copyright © 2025 PortoCode. All Rights Reserved.
//

import Foundation

protocol FeedImageDataStoreSpecs {
    func test_retrieveImageData_deliversNotFoundWhenEmpty() throws
    func test_retrieveImageData_deliversNotFoundWhenStoredDataURLDoesNotMatch() throws
    func test_retrieveImageData_deliversFoundDataWhenThereIsAStoredImageDataMatchingURL() throws
    func test_retrieveImageData_deliversLastInsertedValue() throws
}
