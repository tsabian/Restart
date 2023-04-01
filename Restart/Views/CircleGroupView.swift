//
//  CircleGroupView.swift
//  Restart
//
//  Created by Tiago Almeida de Oliveira on 30/03/23.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - Property

    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimation = false

    // MARK: - Body

    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimation ? 0 : 10)
        .opacity(isAnimation ? 1 : 0)
        .scaleEffect(isAnimation ? 1 : 0.5)
        .animation(.easeIn(duration: 1), value: isAnimation)
        .onAppear {
            isAnimation = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)

            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
