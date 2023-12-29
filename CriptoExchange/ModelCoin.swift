struct ModelCoin: Codable {
    let name: String
    let volumeOneDayUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case name
        case volumeOneDayUsd = "volume_1day_usd"
    }
    
}

