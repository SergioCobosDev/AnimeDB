//
//  RatingView2.swift
//  AnimeDB
//
//  Created by Sergio Cobos on 14/4/24.
//

import SwiftUI

struct RatingView: View {
    let anime: Anime
    var rateStartString: String { anime.rateStart }
    
    init(anime: Anime) {
        self.anime = anime
    }
    
    var rateStartDouble: Double {
        guard let rateDouble = Double(rateStartString) else {
            fatalError()
        }
        return rateDouble
    }

    var body: some View {
        HStack {
                StarRatingView(rating: rateStartDouble)
            Text("\(anime.rateStart)")
        }
    }
}

struct StarRatingView: View {
    var rating: Double
    
    private func starType(for index: Int) -> String {
        if rating >= Double(index) {
            return "star.fill"
        } else if rating >= Double(index) - 0.5 {
            return "star.leadinghalf.fill"
        } else {
            return "star"
        }
    }

    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: starType(for: index))
                    .foregroundColor(.yellow) 
            }
            
        }
    }
}


#Preview {
    RatingView(anime: Anime.previewAnime)
}




//    var rateStartString: String { anime.rateStart }
//
//    init(anime: Anime) {
//        self.anime = anime
//    }
//
//    var rateStartDouble: Double {
//        guard let rateDouble = Double(rateStartString) else {
//            fatalError()
//        }
//        return rateDouble
//    }
//
//    var body: some View {
//        HStack {
//                StarRatingView(rating: rateStartDouble)
//            Text("\(anime.rateStart)")
//        }
//    }
//}

//struct StarRatingView: ViewModifier {
//    var rating: Double
//
//    private func starType(for index: Double) -> String {
//        if rating >= 1.0 {
//            content
//                .foregr
//        } else {
//            content
//                .background(
//                    LinearGradient(gradient: Gradient(stops: [.init(color: .yellow, location: 0.0),.init(color: .yellow, location: rating), .init(color: .clear, location: 1.0)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
//                )
//        } else {
//            return "star"
//        }
//    }
//
//    var body: some View {
//        HStack {
//            ForEach(1...5, id: \.self) { index in
//                Image(systemName: "star.fill"(for: index))
//                    .foregroundColor(.yellow)
//            }
//
//        }
//    }
//}


//struct StarRatingView: View {
//var rating: Double
//
//private func starType(for index: Int) -> String {
//    if rating >= Double(index) {
//        return "star.fill"
//    } else if rating >= Double(index) - 0.5 {
//        return "star.leadinghalf.fill"
//    } else {
//        return "star"
//    }
//}
//
//var body: some View {
//    HStack {
//        ForEach(1...5, id: \.self) { index in
//            Image(systemName: starType(for: index))
//                .foregroundColor(.yellow)
//        }
//        
//    }
//}
//}

//extension String {
//    func toDouble() -> Double {
//        Double(self) ?? 0
//    }
//}

//#Preview {
//RatingView(anime: Anime.previewAnime)
//}
