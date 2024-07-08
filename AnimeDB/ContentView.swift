//
//  ContentView.swift
//  AnimeDB
//
//  Created by Sergio Cobos on 10/4/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AnimeListViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.filteredAnimes, id: \.self) { anime in
                    NavigationLink(value: anime) {
                        CellView(anime: anime)
                    }
                }
            }
            .listStyle(.inset)
            .navigationDestination(for: Anime.self) { anime in
                Text(anime.title)
            }
            .navigationTitle("Animes")
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    ToolbarFilterView()
                }
            }
        }
        .searchable(text: $vm.searchText , prompt: "Search anime" )
        .animation(.bouncy, value: vm.searchText)
    }
}


#Preview {
    ContentView.preview
}
