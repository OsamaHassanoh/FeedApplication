//
//  FeedRepository.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//

import Foundation

class FeedRepository: FeedRepoProtocol {
    private let network: Network
    init(network: Network = NetworkServiceImpl.shared) {
        self.network = network
    }

    func fetchFeeds() async throws -> [FeedSectionEntity] {
        let dto: FeedResponseDTO = try await network.callModel(endpoint: FetchFeedEndPoint())
        return FeedMapper.map(dto)
    }
}

//    func fetchFeeds() async throws -> [FeedSection] {
//
//
//        let dto = try await network.callModel(endpoint: FetchFeedEndPoint())
//
//
//        return FeedMapper.map(dto)
//       }
// }
