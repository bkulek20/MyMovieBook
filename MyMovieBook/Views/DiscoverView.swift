//
//  ContentView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import SwiftUI

struct DiscoverView: View {

    @StateObject var viewModel2 = MovieDiscoverViewModel()
    @State var searchText = ""
    @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {

        VStack{
            Group {
                if let user = viewModel.currentUser {

                    NavigationStack {

                        ScrollView {

                            Text(user.initials)
                          

//                            Text("Welcome \(user.fullname)!")
//                            Text(user.email)
//                            Text("burdaa")
//                                .foregroundColor(.blue)



                            if searchText.isEmpty {
                                if viewModel2.trending.isEmpty {
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
                                                ForEach(viewModel2.trending) { trendingItem in
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
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack {
                                                ForEach(viewModel.favArr) { trendingItem in
                                                    NavigationLink {
                                                        MovieDetailView(movie: trendingItem)
                                                    } label: {
                                                        TrendingCard(trendingItem: trendingItem)
                                                    }
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                        Button {
                                            viewModel.signOut()
                                        } label: {
                                            HStack {
                                                HStack {
                                                    Text("Sign Out")  // Use the provided text variable
                                                        .fontWeight(.semibold)
                                                        .font(.system(size: 14))
                                                }
                                                .foregroundColor(.white)

                                                .frame(width: 327,height: 56)
                                                .background(Color(#colorLiteral(red: 0.2117647059, green: 0.3725490196, blue: 0.2862745098, alpha: 1)))
                                                .cornerRadius(12)
                                            }
                                        }
                                    }
                                }
                            } else {
                                LazyVStack() {
                                    ForEach(viewModel2.searchResults) { item in
                                        VStack {
                                            ForEach(viewModel2.searchResults) { trendingItem in
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
                            viewModel2.search(term: searchText)
                        }
                    }
                    .onAppear {
                        viewModel2.loadTrending()
                    }
                }
                
                
            }
        }

    }
}


#Preview {
    DiscoverView()
        .environmentObject(AuthViewModel())
}
