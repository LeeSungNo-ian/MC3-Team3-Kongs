//
//  YoutubeModelAPI.swift
//  Hypeclass
//
//  Created by 이성노 on 2022/07/28.
//

import Foundation

struct YoutubeModelAPI: Codable {
    let kind: String
    let etag: String
    let items: [Item]
}

struct Item: Codable {
    let kind: String
    let etag: String
    let id: String
    let snippet: Snippet
}

struct Snippet: Codable {
    let publishedAt: Date
    let channelID: String
    let title: String
    let snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: String

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle
    }
}

struct Thumbnails: Codable {
    let defaults: Thumbnail
    let medium: Thumbnail
    let high: Thumbnail
    let standard: Thumbnail?
    let maxres: Thumbnail?

    enum CodingKeys: String, CodingKey {
        case defaults = "default"
        case medium, high, standard, maxres
    }
}

struct Thumbnail: Codable {
    let url: String
    let width: Int
    let height: Int
}

