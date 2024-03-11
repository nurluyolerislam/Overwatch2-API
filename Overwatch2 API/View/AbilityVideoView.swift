//
//  AbilityDetailView.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import SwiftUI
import AVKit

struct AbilityVideoView: View {
    private var link: Link
    
    init(link: Link) {
        self.link = link
    }
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: link.mp4))
    }
}
