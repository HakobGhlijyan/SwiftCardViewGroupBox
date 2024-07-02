//
//  ContentView.swift
//  SwiftCardViewGroupBox
//
//  Created by Hakob Ghlijyan on 02.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.pink.gradient)
                .ignoresSafeArea()
            
            VStack {
    //            GroupBox {
    //                Text("This is my groupbox. Isn't it cool. It's like a card view. Awesome!")
    //            }
    //            GroupBox("My Content") {
    //                Text("This is my groupbox. Isn't it cool. It's like a card view. Awesome!")
    //            }
    //            GroupBox("My Content") {
    //                Text("This is my groupbox.")
    //            }
    //            GroupBox("My Content") {
    //                Text("This is my groupbox. Isn't it cool. It's like a card view. Awesome!")
    //            }
    //            .frame(width: 240)
                
                GroupBox {
                    Text("This is my groupbox. Isn't it cool. It's like a card view. Awesome!")
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                }
                
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                        .foregroundStyle(.pink)
                }
                
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }
                    .groupBoxStyle(.music)
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                }
                .groupBoxStyle(.music)
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
//    MusicPlayerView()
}

struct MusicPlayerView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.secondary)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool Song Title")
                        .font(.headline.bold())
                    
                    Text("Artist Name")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(.bottom, 8)
            
            ProgressView(value: 0.4, total: 1.0)
                .tint(.secondary)
                .padding(.bottom, 20)
            
            HStack(spacing: 30) {
             Image(systemName: "backward.fill")
             Image(systemName: "pause.fill")
             Image(systemName: "forward.fill")
            }
            .foregroundStyle(.secondary)
            .font(.title)
        }
    }
}

struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .bold()
                .foregroundStyle(.pink)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}
