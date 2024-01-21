//
//  ComposableArchitectureTutorialApp.swift
//  ComposableArchitectureTutorial
//
//  Created by 김동준 on 1/20/24
//

import SwiftUI
import ComposableArchitecture

@main
struct ComposableArchitectureTutorialApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
    }
    var body: some Scene {
        WindowGroup {
            AppView(store: ComposableArchitectureTutorialApp.store)
        }
    }
}
