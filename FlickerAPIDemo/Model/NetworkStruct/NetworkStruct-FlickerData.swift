//
//  NetworkStruct-FlickerData.swift
//  FlickerAPIDemo
//
//  Created by will on 2022/1/26.
//

import Foundation

// MARK: - SearchResponse
struct SearchResponse: Codable {
    let photos: Photos
}

// MARK: - Photos
struct Photos: Codable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: Int?
    let photo: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, owner, secret: String?
    let server: String?
//    let farm: Int?
    let title: String?
    
}
