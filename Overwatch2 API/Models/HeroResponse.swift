//
//  HeroResponse.swift
//  Overwatch2 API
//
//  Created by Erislam Nurluyol on 11.03.2024.
//

import Foundation

// MARK: - Ability
struct HeroResponse: Codable {
    let name, description: String
    let portrait: URL
    let role, location: String
    let hitpoints: Hitpoints
    let abilities: [Ability]
    let story: Story
}

// MARK: - Ability
struct Ability: Codable, Identifiable {
    let id = UUID()
    let name, description: String
    let icon: URL
    let video: Video
}

// MARK: - Video
struct Video: Codable {
    let thumbnail: URL
    let link: Link
}

// MARK: - Link
struct Link: Codable {
    let mp4, webm: URL
}

// MARK: - Hitpoints
struct Hitpoints: Codable {
    let armor, health, shields, total: Int
}

// MARK: - Story
struct Story: Codable {
    let summary: String
    let media: Media
    let chapters: [Chapter]
}

// MARK: - Chapter
struct Chapter: Codable {
    let title, content, picture: String
}

// MARK: - Media
struct Media: Codable {
    let type, link: String
}

