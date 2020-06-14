//
//  Video.swift
//  TiktokSwiftUI
//
//  Created by Giresh Dora on 13/06/20.
//  Copyright © 2020 Giresh. All rights reserved.
//

import Foundation
import AVKit

struct Video: Identifiable {
    
    var id: Int
    var player: AVPlayer
    var replay: Bool
}

