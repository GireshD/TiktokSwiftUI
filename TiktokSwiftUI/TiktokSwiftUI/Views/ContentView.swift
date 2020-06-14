//
//  ContentView.swift
//  TiktokSwiftUI
//
//  Created by Giresh Dora on 13/06/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var data = [

        Video(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video4", ofType: "mp4")!)), replay: false),
        Video(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video5", ofType: "mp4")!)), replay: false),
        Video(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video2", ofType: "mp4")!)), replay: false),
        Video(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video3", ofType: "mp4")!)), replay: false),
        Video(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video1", ofType: "mp4")!)), replay: false),
        Video(id: 5, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video6", ofType: "mp4")!)), replay: false),
    ]
    
    var body: some View {
        ZStack{
            
            PlayerScrollView(data: self.$data)
            
            VStack{
                
                TopTabBar()
                
                Spacer()
                
                RightTabBar()
                
                TabBar()
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
            
            
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBar: View {
    @State var index: Int = 0;
    var body: some View{
        HStack(spacing:0){
            
            Button(action:{
                self.index = 0
            }) {
               Image("home")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(self.index == 0 ? .white : Color.white.opacity(0.3))
                .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 1
            }) {
               Image("search")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(self.index == 1 ? .white : Color.white.opacity(0.3))
                .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 2
            }) {
               Image("upload")
                .renderingMode(.original)
                .resizable()
                .frame(width: 50, height: 35)
                .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 3
            }) {
               Image("comment")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(self.index == 3 ? .white : Color.white.opacity(0.3))
                .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            Button(action:{
                self.index = 4
            }) {
               Image("profile")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(self.index == 4 ? .white : Color.white.opacity(0.3))
                .padding(.horizontal)
            }
        }
        .padding()
    }
}

struct RightTabBar: View {

    var body: some View{
        
        HStack{
            Spacer()
            
            VStack(spacing: 35){
                
                Button(action:{
                    
                }) {
                    Image("pic")
                        .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
                
                Button(action:{
                    
                }){
                    VStack(spacing: 8){
                        
                        Image(systemName: "suit.heart.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                    
                }
                
                Button(action:{
                    
                }){
                    VStack(spacing: 8){
                        
                        Image(systemName: "message.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                    
                }
                
                Button(action:{
                    
                }){
                    VStack(spacing: 8){
                        
                        Image(systemName: "arrowshape.turn.up.right.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            .padding(.bottom, 55)
            .padding(.trailing)
        }
    }
}

struct TopTabBar: View {
    @State var top = 0
    
    var body: some View{
        
        HStack(spacing: 15){
            
            Button(action: {
                self.top  = 0
            }){
                Text("Following")
                    .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.3))
                    .fontWeight(self.top == 0 ? .bold : .none)
                    .padding(.vertical)
            }
            
            Button(action: {
                self.top = 1
            }){
                Text("For You")
                    .foregroundColor(self.top == 1 ? .white : Color.white.opacity(0.3))
                    .fontWeight(self.top == 1 ? .bold : .none)
                    .padding(.vertical)
            }
            
            
        }
    }
}





class Host: UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}



