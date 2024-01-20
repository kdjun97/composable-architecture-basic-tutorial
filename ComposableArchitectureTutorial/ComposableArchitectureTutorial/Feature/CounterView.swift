//
//  ContentView.swift
//  ComposableArchitectureTutorial
//
//  Created by 김동준 on 1/20/24
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack {
                Text("\(viewStore.counter)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                  HStack {
                    Button{
                        viewStore.send(.minusButtonTapped)
                    } label: {
                        Text("-")
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                      Button{
                        viewStore.send(.plusButtonTapped)
                      } label: {
                          Text("+")
                      }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                  }
                }
            .padding()
        }
    }
}
