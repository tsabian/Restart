//
//  HomeView.swift
//  Restart
//
//  Created by Tiago Almeida de Oliveira on 30/03/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Property

    @AppStorage(onboardingStorageKey) var isOnboardingViewActive = false
    @State private var isAnimating = false

    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER

            Spacer()

            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }

            // MARK: - CENTER

            Text("The time that leads to mastery is dependent on the itensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            // MARK: - FOOTER

            Spacer()

            Button {
                withAnimation {
                    playSound(sound: .success)
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)

                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
