//
//  AppView.swift
//  ComposableArchitectureTutorial
//
//  Created by 김동준 on 1/21/24
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        TabView {
            CounterView(store: store.scope(state: \.tab1, action: \.tab1))
            .tabItem {
                Text("Counter 1")
            }
            CounterView(store: store.scope(state: \.tab2, action: \.tab2))
            .tabItem {
                Text("Counter 2")
            }
        }
    }
}
