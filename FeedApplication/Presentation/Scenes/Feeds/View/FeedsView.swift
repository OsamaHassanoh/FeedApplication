//
//  FeedsView.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//



import SwiftUI
import Combine

struct FeedsView: View {
//    @StateObject private var viewModel: FeedsViewModel
    @State private var selectedSectionID: String = ""
        @StateObject private var viewModel = FeedsViewModel(
            fetchFeedsUseCase: FetchFeedsUseCase(repository: FeedRepository())
        )

    var body: some View {
        VStack {
            switch viewModel.state {
            case .loading:
                LoadingView()

            case .error:
                Text(viewModel.errorMessage ?? "Something went wrong")

            case .loaded:
                content
            }
        }
        .onAppear {
            onAppear()
        }
    }

    private var content: some View {
        VStack(spacing: 0) {
            FeedSectionSelectorView(
                feedSectionEntity: viewModel.filteredFeeds,
                selectedSectionID: selectedSectionID
            ) { id in
                selectedSectionID = id
            }

            Divider()

            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(currentPosts) { post in
                        PostCardView(postEntity: post)
                    }
                }
                .padding(.vertical)
            }
        }
        .onAppear {
            if selectedSectionID.isEmpty {
                selectedSectionID = viewModel.filteredFeeds.first?.id ?? ""
            }
        }
    }

    private var currentPosts: [PostEntity] {
        viewModel.filteredFeeds.first(where: { $0.id == selectedSectionID })?.posts ?? []
    }
    
    private func onAppear() {
            guard viewModel.fetchFeeds.isEmpty else { return }
    
            Task {
                await viewModel.fetchGetAssignSchools()
               
            }
        }
}

