import Foundation
import Alamofire

final class NetworkManager {
    static let instance = NetworkManager()
    
    private init() {}
    
    enum Constanse {
        static let coinBaseURL = "https://rest.coinapi.io/v1"
    }
    
    enum CoinEndPoint {
        static let assets = "/assets"
        static let exchanges = "/exchanges"
    }
    
    let header: HTTPHeaders = [
        "X-CoinAPI-Key": "BECA3812-AEA8-4843-83DA-8744B841C198",
        "Accept": "application/json"
    ]
    
    
    
    func getAssets(completion: @escaping(Result<[ModelCoin], RequestError>) -> Void) {
        AF.request(Constanse.coinBaseURL + CoinEndPoint.assets, headers: header).responseDecodable(of: [ModelCoin].self) { response in
            switch response.result {
            case .success(let coin):
                completion(.success(coin))
            case .failure:
                completion(.failure(.ErrorRequest))
            }
        }
    }
    
}
