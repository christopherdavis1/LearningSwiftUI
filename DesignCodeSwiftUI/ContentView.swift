//
//  ContentView.swift
//  DesignCodeSwiftUI
//
//  Created by Christopher Davis on 7/2/19.
//  Copyright © 2019 Christopher Davis. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .blendMode(.hardLight)
                .animation(.basic(duration: 0.25, curve: .easeOut))
                .offset(x: viewState.width, y: viewState.height)
            
            CardView()
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .blendMode(.hardLight)
                .animation(.basic(duration: 0.25, curve: .easeOut))
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .animation(.spring())
                .tapAction {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                    }
                        .onEnded { value in
                            self.viewState = CGSize.zero
                    }
            )
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


// MARK : COMPONENTS

struct CardView : View {
    var body: some View {
        return VStack {
            Text("Card Back")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 20)
        
    }
}

struct CertificateView : View {
    var body: some View {
        return VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.headline)
                        .fontWeight(.bold)
                        .color(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .color(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                }
                .padding(.horizontal)
            Spacer()
            Image("Background")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

struct TitleView : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
            }.padding()
    }
}

struct CardBottomView : View {
    var body: some View {
        return VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Chris Davis has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(y: 500)
    }
}
