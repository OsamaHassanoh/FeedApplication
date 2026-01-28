//
//  FeedApplicationApp.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//

import SwiftUI

@main
struct FeedApplicationApp: App {
    @Environment(\.scenePhase) private var scenePhase // Observe scene phase changes
    @StateObject private var themeManager = ThemeManager()
    var body: some Scene {
        WindowGroup {
            FeedView()
                .environmentObject(themeManager)
        }
    }
}
