//
//  AnimeListViewModel.swift
//  AnimeDB
//
//  Created by Sergio Cobos on 11/4/24.
//

import Foundation

final class AnimeListViewModel: ObservableObject {
    
    let animeInteractor: AnimeInteractor
    @Published var animes: [Anime] = [] {
        didSet {
            try? animeInteractor.saveAnimes(animes: animes)
        }
    }
    
    @Published var orderBy: OrderBy = .title
    @Published var orderedType: AnimeType = .all
    @Published var orderedGenre: AnimeGenre = .all
    @Published var orderedStatus: AnimeStatus = .all
    
    @Published var searchText = ""
    
    var favoritedAnimes: [Anime] {
        animes
            .filter { $0.isFavorited }
            .filter { searchFilter(anime: $0) }
    }
    
    var filteredAnimes: [Anime] {
        animes
            .filter { searchFilter(anime: $0) }
            .filter { orderedTypeAnime(anime: $0)}
            .filter({ orderedStatusAnime(anime: $0)})
            .filter({ orderedGenreAnime(anime: $0)})
            .sorted { OrderAnime(anime1: $0, anime2: $1) }
        
    }
    
    init(animeInteractor: AnimeInteractor = AnimeInteractor()) {
        self.animeInteractor = animeInteractor
        getAnimes()
    }
    
    func searchFilter(anime: Anime) -> Bool {
        if searchText.isEmpty {
            true
        } else {
            anime.title.localizedStandardContains(searchText)
        }
    }
    
    func getAnimes() {
        do {
            self.animes = try animeInteractor.loadAnimes()
        } catch {
            print(error)
        }
    }
    
    func OrderAnime(anime1: Anime, anime2: Anime) -> Bool {
        switch orderBy {
            case .title:
                anime1.title < anime2.title
            case .titleDescendent:
                anime1.title > anime2.title
            case .rating:
                anime1.rateStart > anime2.rateStart
            case .year:
                anime1.year > anime2.year
            case .yearDescent:
                anime1.year < anime2.year
        }
    }
    
    func orderedTypeAnime (anime: Anime) -> Bool {
        orderedType == .all ? true : orderedType == anime.type
    }
    
    func orderedStatusAnime (anime: Anime) -> Bool {
        orderedStatus == .all ? true : orderedStatus == anime.status
    }
    
    func orderedGenreAnime (anime: Anime) -> Bool {
        
        orderedGenre == .all ? true : anime.genres?.contains(orderedGenre) ?? true
    }
}

    
//    enum OrderBy: String {
//        case title = "Title "
//        case titleDescendent = "Title descendent"
//        case rating = "Rating"
//        case year = "Year"
//        case yearDescendant = "Year descendant"
//    }
//}
    



//    func sortList()  -> [Anime] {
//        if searchText.isEmpty {
//            animes.filter { anime in
//                anime.title.localizedStandardContains(searchText)
//            }
//        } else {
//            animes
//        }
//    }
