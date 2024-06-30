//
//  Drama.swift
//  NetflixThumbnail
//
//  Created by 김동운 on 6/30/24.
//

import Foundation

/*
 JSON 에서 스위프트로 파싱할 데이터 타입은 Decodable을 구현한다
 반대의 경우는 Encodable을 구현한다
 둘 다 의 경우 Codable을 구현한다
 */
struct DramaCollection: Codable {
    var bigBanner: String
    var dramas: [Drama]
    
    enum CodingKeys: String, CodingKey {
        case bigBanner = "BIG_BANNER"
        case dramas = "DRAMAS"
    }
}

struct Drama: Codable {
    var categoryTitle: String
    var posters: [String]
    
    enum CodingKeys: String, CodingKey {
        case categoryTitle = "CATEGORY_TITLE"
        case posters = "POSTERS"
    }
}
