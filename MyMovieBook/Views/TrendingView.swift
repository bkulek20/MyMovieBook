//
//  TrendingView.swift
//  MyMovieBook
//
//  Created by Emre Taşkend on 8.01.2024.
//

import SwiftUI
// trendingde arama eksik card tuhaf duruyor
struct TrendingView: View {
    @StateObject var viewModel = TrendingViewModel()
    @State var searchText = ""
    var body: some View {
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
                            }
                            .padding(.horizontal)
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack {
                                    ForEach(viewModel.trending) { trendingItem in
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
                } else {
                    LazyVStack() {
                        ForEach(viewModel.searchResults) { item in
                            HStack {
                                AsyncImage(url: item.backdropURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 120)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                .clipped()
                                .cornerRadius(10)

                                VStack(alignment:.leading) {
                                    Text(item.title)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    HStack {
                                        Image(systemName: "hand.thumbsup.fill")
                                        Text(String(format: "%.1f", item.vote_average))
                                        Spacer()
                                    }
                                    .foregroundColor(.yellow)
                                    .fontWeight(.heavy)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(Color(red:61/255,green:61/255,blue:88/255))
                            .cornerRadius(20)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .background(Color(red:39/255,green:40/255,blue:59/255).ignoresSafeArea())
        }
        .onChange(of: searchText) {
            viewModel.searchResults.removeAll()
            if searchText.count > 2 {
                viewModel.search(term: searchText)
            }
        }
        .onAppear {
            viewModel.loadTrending()
        }
    }
}

#Preview {
    TrendingView()
}
