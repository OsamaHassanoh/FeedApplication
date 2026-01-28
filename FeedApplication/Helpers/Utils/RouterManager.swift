//
//  RouterManager.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//

import Foundation
import SwiftUI
import Combine

enum Route: Hashable, Equatable {  // Conform to Equatable
    case feedsView
}

class Router: ObservableObject {
    @Published var path = NavigationPath()  // Stores the navigation stack
    func navigate(to route: Route) {
        path.append(route)
    }
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    func reset() {
        path = NavigationPath()
    }
    @ViewBuilder
    func destination(for route: Route) -> some View {
        switch route {
        case .feedsView:
            FeedsView()
       
        }
    }
}

