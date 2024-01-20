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
    var body: some Scene {
        WindowGroup {
            CounterView(
                store: Store(
                    initialState: CounterFeature.State()) {
                        CounterFeature()
                            ._printChanges()
                    }
            )
        }
    }
}
