//
//  ContentView.swift
//  Restart
//
//  Created by Tiago Almeida de Oliveira on 30/03/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(onboardingStorageKey) var isOnboardingViewActive = true

    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
