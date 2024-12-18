//
//  ContentView.swift
//  AnimatedText
//
//  Created by keet on 18.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    @State private var text = "Open"
    
    var body: some View {
        VStack {
            if !animate { Spacer() }
            
            HStack {
                if !animate { Spacer() }
                
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: animate ? 350 : 100, height: animate ? 400 : 50)
                    .foregroundStyle(.blue)
                    .overlay {
                        HStack {
                            if animate {
                                Image(systemName: "arrowshape.backward.fill")
                            }
                            
                            Text(text)
                                .bold()
                                .transition(.identity)
                                .onTapGesture {
                                    if animate {
                                        text = "Open"
                                    } else {
                                        text = "Close"
                                    }
                                    
                                    withAnimation(.default) {
                                        animate.toggle()
                                    }
                                }
                        }
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: animate ? .topLeading : .center)
                        .padding()
                    }
                    .onTapGesture {
                        if !animate {
                            text = "Close"
                            
                            withAnimation(.default) {
                                animate.toggle()
                            }
                        }
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
