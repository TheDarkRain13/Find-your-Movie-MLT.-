//
//  Movie.swift
//  Find your Movie (MLT.)
//
//  Created by xPaulx14 on 18.10.26.
//

import Foundation

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let runtime: Int?
    let posterPath: String?
    let genres: [Genre]
    var posterURL: URL? {
        if let path =  posterPath {
            return URL(string:"https://image.tmdb.org/t/p/w342\(path)")
        }
        return nil
    }
}

extension Movie {
    static let sample = Movie(
        id: 969681,
        title: "Spider-Man: Brand New Day",
        overview: "Peter Parker bekämpft als Spider-Man in Vollzeit das Verbrechen, in einer Welt, die sich nicht mehr an ihn erinnert. Während seine alten Freunde weiterziehen, löst der Druck eine Veränderung in ihm aus, die er vielleicht nicht kontrollieren kann. Doch genau diese Veränderung könnte ihn gegen eine neue Bedrohung wappnen: einen mächtigen Schurken, den niemand sehen kann.",
        releaseDate: "2026-07-29",
        voteAverage: 7.9,
        runtime: 145,
        posterPath: "/yeba3Y820OjApZO9aJevDsNeMEd.jpg",
        genres: [
            Genre(id: 878, name: "Science Fiction"),
            Genre(id: 28, name: "Action"),
            Genre(id: 12, name: "Abenteuer")
        ]
    )
}
