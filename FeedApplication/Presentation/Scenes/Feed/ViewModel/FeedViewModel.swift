//
//  FeedViewModel.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//
//
//import Combine
//import CoreLocation
//import SwiftUI
//@MainActor
//class FeedViewModel: ObservableObject {
//    private let fetchFeedsUseCase: FetchFeedsUseCaseProtocol
//    private var cancellables: Set<AnyCancellable> = []
//    @Published var fetchFeeds: [FeedSectionEntity] = []
//    @Published var filteredFeeds: [FeedSectionEntity] = [] // Add a filtered array for showing filtered schools
//    @Published var errorMessage: String?
//    @Published var userCountry: String? = nil
//    @Published var state: FormState = .loading
//    @Published var reachabilityManager = NetworkReachabilityManager.shared
//    @Published var success: Bool = false
//
//    init(fetchFeedsUseCase: FetchFeedsUseCaseProtocol) {
//        self.fetchFeedsUseCase = fetchFeedsUseCase
//        /* initializeLocationAndData */ ()
//    }
//    @MainActor
//    func fetchGetAssignSchools() async {
//        do {
//            state = .loading
//            let fetchFeeds = try await fetchFeedsUseCase.fetchFeeds()
//            self.fetchFeeds = fetchFeeds
//            filteredFeeds = self.fetchFeeds // Set filtered schools initially to all schools
//            state = .loaded
//        } catch {
//            errorMessage = error.localizedDescription
//            state = .error
//        }
//    }
//}

import Combine
import SwiftUI

@MainActor
final class FeedViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published private(set) var feeds: [FeedSectionEntity] = []
    @Published private(set) var state: FormState = .loading
    @Published private(set) var errorMessage: String?
    
    // MARK: - Private Properties
    private let fetchFeedsUseCase: FetchFeedsUseCaseProtocol
    
    // MARK: - Initialization
    init(fetchFeedsUseCase: FetchFeedsUseCaseProtocol) {
        self.fetchFeedsUseCase = fetchFeedsUseCase
    }
    
    // MARK: - Public Methods
    func loadFeeds() async {
        state = .loading
        errorMessage = nil
        
        do {
            feeds = try await fetchFeedsUseCase.fetchFeeds()
            state = .loaded
        } catch {
            errorMessage = error.localizedDescription
            state = .error
        }
    }
}
