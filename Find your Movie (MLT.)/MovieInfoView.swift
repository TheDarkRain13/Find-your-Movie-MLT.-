//
//  MovieInfoView.swift
//  Find your Movie (MLT.)
//
//  Created by xPaulx14 on 18.10.26.
//

import SwiftUI

struct  MovieInfoView: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing:20) {
                HStack(alignment: .top, spacing: 16) {
                   AsyncImage(url: movie.posterURL){
                        image in
                            image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray
                    }
                   .frame(width: 120, height: 180)
                   .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 8) {
                        Text(movie.title)
                            .font(.largeTitle)
                            .bold()
                        Text(movie.releaseDate)
                            .foregroundStyle(.secondary)
                        Text(movie.genres.map {$0.name}.joined(separator: ", "))
                            .foregroundStyle(.secondary)
                        if let minutes = movie.runtime {
                                Text("\(minutes) Min.")
                                    .font(.caption)
                        }
                        Text(String(format: "%.1f", movie.voteAverage))
                            .foregroundStyle(.tertiary)
                    }
                }
                Text("Description")
                    .font(.headline)
                Text(movie.overview)
    
            }.padding()
        }
    }
}

#Preview {
    MovieInfoView(movie: Movie.sample)
}
