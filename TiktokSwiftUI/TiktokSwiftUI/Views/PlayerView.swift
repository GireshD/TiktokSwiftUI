//
//  PlayerView.swift
//  TiktokSwiftUI
//
//  Created by Giresh Dora on 14/06/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import Foundation
import SwiftUI

struct PlayerView: View {
    
    @Binding var data: [Video]
    
    var body: some View{
        
        VStack(spacing: 0){
            
            ForEach(0..<self.data.count){i in
                
                ZStack{
                    
                    Player(player: self.data[i].player)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .offset(y: -5)
                    
                    if self.data[i].replay{
                        Button(action: {
                            self.data[i].player.seek(to: .zero)
                            self.data[i].player.play()
                            self.data[i].replay = false
                        }){
                            Image(systemName: "goforward")
                            .resizable()
                            .frame(width: 55, height: 60)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .onAppear{
            self.data[0].player.play()
            
            self.data[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { (_) in
                
                self.data[0].replay = true
            }
        }
    }
}
