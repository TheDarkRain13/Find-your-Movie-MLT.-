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
                        HStack(spacing : 4) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text(String(format: "%.1f", movie.voteAverage))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                VStack(alignment: leading, spacing: 8){
                    Text("Description")
                        .font(.headline)
                    Text(movie.overview)
                        .padding(.top, 30)
                        .background(SecondarySystemBackground)
                }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .classEffect(12)
                    .padding(.top, 30)
            }.padding()
        }
    }
}

#Preview {
    MovieInfoView(movie: Movie.sample)
}