//
//  DiscoverView.swift
//  MovieLookup
//
//  Created by Beau Nouvelle on 20/2/2023.
//

import SwiftUI

struct DiscoverView: View {

    @StateObject var viewModel = MovieDiscoverViewModel()
    @State var searchText = ""

    var body: some View {
        VStack{
            NavigationStack {
                ScrollView {
                    if searchText.isEmpty {
                        if viewModel.trending.isEmpty {
                            Text("No Results")
                        } else {
                            VStack {
                                HStack {
                                    Text("Trending")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                    Spacer()
                                    NavigationLink(
                                        destination: TrendingView()
                                    ) {
                                        Text("see all")
                                    }
                                }
                                .padding(.horizontal)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(viewModel.trending) { trendingItem in
                                            NavigationLink {
                                                MovieDetailView(movie: trendingItem)
                                            } label: {
                                                TrendingCard(trendingItem: trendingItem)
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                                HStack{
                                    Text("Favourites")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .fontWeight(.heavy)
                                    Spacer()
                                    NavigationLink(
                                        destination: FavouritesView()
                                    ) {
                                        Text("see all")
                                    }
                                }.padding(.horizontal
                                )
                            }
                        }
                    } else {
                        LazyVStack() {
                            ForEach(viewModel.searchResults) { item in
                                VStack {
                                    ForEach(viewModel.searchResults) { trendingItem in
                                        NavigationLink {
                                            MovieDetailView(movie: trendingItem)
                                        } label: {
                                            MovieCardViewVertical(trendingItem: trendingItem)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                if searchText.count > 2 {
                    viewModel.search(term: searchText)
                }
            }
            .onAppear {
                viewModel.loadTrending()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
