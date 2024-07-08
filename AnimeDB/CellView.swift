//
//  CellView.swift
//  AnimeDB
//
//  Created by Sergio Cobos on 12/4/24.
//

import SwiftUI

struct CellView: View {
    let anime: Anime
    var body: some View {
        HStack(spacing: 8){
            AsyncImage(url: anime.image) {image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 105)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .controlSize(.extraLarge)
                    .scaledToFit()
                    .frame(width: 105)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack (alignment: .leading, spacing: 8){
                Text(anime.title)
                    .bold()
                Text("Episodes: \(anime.episodes)")
                HStack {
                    RatingView(anime: anime)
                }
//                Text("Rate: \(anime.rateStart)")
            }
        }
    }
}



#Preview {
    List {
        CellView(anime: Anime.previewAnime)
    }
}
