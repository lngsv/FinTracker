//
//  IconBuilder.swift
//  FinanceTracking
//
//  Created by Alan Gasiev on 2024-08-24.
//

import SwiftUI

struct IconBuilder: View {
    var debugBuild: Bool

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(
//                    LinearGradient(
//                        colors: [
//                            .black,
//                            .yellow,
//                            .black
//                        ],
//                        startPoint: .bottomLeading,
//                        endPoint: .topTrailing
//                    )
//                    AngularGradient(
//                        colors: [
//                            .black,
//                            .yellow,
//                            .black
//                        ],
//                        center: .center,
//                        angle: .degrees(90 * 3 + 45)
//                    )
                    RadialGradient(
                        colors:[.green, .black],
                        center: .center,
                        startRadius: 0,
                        endRadius: 350
                    )
//                    Gradient(colors: [
//                        .yellow,
//                        .yellow,
//                        .yellow,
//                        .black.opacity(0.8),
//                    ])

                )

            VStack {
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .scaledToFit()
                    .padding(100)
//                    .shadow(color: .gray.opacity(0.3), radius: 10)



            }
            .foregroundStyle(.white)




            if debugBuild {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.black)

                    VStack {
                        Text("FinTracker")
                        Text("D  E  B  U  G")
                    }
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white)
                }
                .frame(maxHeight: 100)
            } else {
//                VStack {
//                    Spacer()
//                    ZStack {
//                        Text("FinTracker")
//                            .font(.system(size: 32, weight: .bold, design: .rounded))
//                            .bold()
//                            .padding(.bottom)
//                            .foregroundStyle(.white)
//                            .shadow(color: .gray.opacity(0.5), radius: 10)
//                    }
//
//
//                }
            }
        }
            .frame(width: 512, height: 512)
    }
}

#Preview {
    IconBuilder(debugBuild: true)
}
