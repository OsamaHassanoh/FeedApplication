//
//  FeedsViewModel.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//


import SwiftUI
import CoreLocation
import Combine

@MainActor
class FeedViewModel: ObservableObject {
    
    private let fetchFeedsUseCase: FetchFeedsUseCaseProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var fetchFeeds: [FeedSectionEntity] = []
    @Published var filteredFeeds: [FeedSectionEntity] = []  // Add a filtered array for showing filtered schools
    @Published var errorMessage: String?
    @Published var userCountry: String? = nil
    @Published var state: FormState = .loading
    @Published var reachabilityManager = NetworkReachabilityManager.shared
    @Published var success: Bool = false
    
    init(fetchFeedsUseCase: FetchFeedsUseCaseProtocol) {
        self.fetchFeedsUseCase = fetchFeedsUseCase
        /*initializeLocationAndData*/()
    }
    @MainActor
    func fetchGetAssignSchools() async {
        do {
            state = .loading
            let fetchFeeds = try await fetchFeedsUseCase.fetchFeeds()
            self.fetchFeeds = fetchFeeds
            self.filteredFeeds = self.fetchFeeds  // Set filtered schools initially to all schools
            state = .loaded
        } catch {
            self.errorMessage = error.localizedDescription
            state = .error
        }
    }
    
}

