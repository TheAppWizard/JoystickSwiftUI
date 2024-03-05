//
//  ContentView.swift
//  JoystickSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 29/02/24.
//

//  MARK: Instagram
//  TheAppWizard
//  MARK: theappwizard2408


import SwiftUI

struct ContentView: View {
    var body: some View {
        JoypadView()
    }
}

#Preview {
    ContentView()
}












struct JoypadView: View {
    @State private var knobPosition: CGSize = .zero
    @State private var showUpChevron = false
    @State private var showDownChevron = false
    @State private var showLeftChevron = false
    @State private var showRightChevron = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(width: 250, height: 250)
                        .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 5, y: 5)

                    ZStack {
                        Circle()
                            .fill(
                                RadialGradient(gradient: Gradient(colors: [
                                    Color.gray.opacity(0.1),
                                    Color.gray.opacity(0.2),
                                    Color.gray.opacity(0.3),
                                    Color.black
                                ]), center: .center, startRadius: 0, endRadius: 200)
                            )
                            .opacity(0.5)
                            .frame(width: 150, height: 150)
                            .offset(x: knobPosition.width * 0.6, y: knobPosition.height * 0.6)

                        Circle()
                            .fill(
                                RadialGradient(gradient: Gradient(colors: [
                                    Color.red,
                                    Color.red.opacity(0.5),
                                    Color.red.opacity(0.7),
                                    Color.black
                                ]), center: .center, startRadius: 0, endRadius: 200)
                            )
                            .frame(width: 100, height: 100)
                            .offset(knobPosition)
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let distance = sqrt(pow(value.translation.width, 2) + pow(value.translation.height, 2))
                                if distance <= 75 {
                                    knobPosition = value.translation
                                    
                                    // Set flags to show chevrons based on drag direction
                                    showUpChevron = value.translation.height < -10
                                    showDownChevron = value.translation.height > 10
                                    showLeftChevron = value.translation.width < -10
                                    showRightChevron = value.translation.width > 10
                                }
                            }
                            .onEnded { _ in
                                knobPosition = .zero
                                // Reset flags when drag ends
                                showUpChevron = false
                                showDownChevron = false
                                showLeftChevron = false
                                showRightChevron = false
                            }
                    )
                }
                .frame(width: 200, height: 200)
            }
            
            VStack {
                HStack {
                    Text("J O Y S T I C K")
                        .foregroundColor(.white.opacity(0.2))
                        .font(.system(size: 20))
                    Spacer()
                    Text("X: \(Int(knobPosition.width)), Y: \(Int(knobPosition.height))")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                .padding(20)
                Spacer()
                
                
                HStack{
                    Spacer()
                    if(!showUpChevron && !showDownChevron && !showLeftChevron && !showRightChevron)
                    {
                        Text("I D L E")
                            .foregroundStyle(.white.opacity(1))
                            .font(.system(size: 20))
                    }
                    
                    
                    
                    if(showUpChevron){
                        Text("F O R W A R D")
                            .foregroundStyle(.white.opacity(1))
                            .font(.system(size: 20))
                    }
                   
                    if(showDownChevron){
                        Text("B A C K W A R D")
                            .foregroundStyle(.white.opacity(1))
                            .font(.system(size: 20))
                    }
                    
                    
                    if(showLeftChevron){
                        Text("L E F T")
                            .foregroundStyle(.white.opacity(1))
                            .font(.system(size: 20))
                    }
                    
                    if(showRightChevron){
                        Text("R I G H T")
                            .foregroundStyle(.white.opacity(1))
                            .font(.system(size: 20))
                    }
                    
                    Spacer()
                }
                
                
                
            }
            
            ZStack {
                VStack {
                    Image(systemName: "chevron.up")
                        .font(.system(size: 35))
                        .foregroundColor(showUpChevron ? .white : .white.opacity(0.2))

                    Spacer()

                    Image(systemName: "chevron.down")
                        .font(.system(size: 35))
                        .foregroundColor(showDownChevron ? .white : .white.opacity(0.2))
                }
                .frame(height: 350)

                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 35))
                        .foregroundColor(showLeftChevron ? .white : .white.opacity(0.2))

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.system(size: 35))
                        .foregroundColor(showRightChevron ? .white : .white.opacity(0.2))
                }
                .frame(width: 350)
            }
        }
    }
}






