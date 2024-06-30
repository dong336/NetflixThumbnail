import UIKit

Task {
    let url =
        URL(string: "https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")!
    
    let (data, _) = try! await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    
    let dramaCollection = try!
        decoder.decode(DramaCollection.self, from: data)
    
    print("빅배너: ", dramaCollection.bigBanner)
    
    for drama in dramaCollection.dramas {
        print("카테고리 타이틀: ", drama.categoryTitle)
        
        for poster in drama.posters {
            print("포스터 이미지 주소: ", poster)
        }
    }
}

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
