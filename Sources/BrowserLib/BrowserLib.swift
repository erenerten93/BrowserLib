import Foundation


public enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

public struct BrowserLib {
    public private(set) var text = "Hello, World!"

    
    
    public init(){
        
    }
  
     private func createURLRequest(with router:Router) -> URLRequest{
          var components = URLComponents()
          components.scheme = router.scheme
          components.host = router.host
          components.path = router.path
          components.queryItems = router.parameters
          let url = components.url
          var urlRequest = URLRequest(url: url!)
         
          urlRequest.httpMethod = router.method
          print(urlRequest) // to see url request
          return urlRequest
      }
      
    public func fetchData<T: Decodable>(from router: Router, completion: @escaping (Result<T, APIError>) -> Void) {
          
          let urlRequest = createURLRequest(with: router)
          let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
              if let error = error {
                  completion(.failure(.networkError(error)))
                  return
              }
              guard let data = data else {
                  completion(.failure(.networkError(NSError(domain: "", code: 0, userInfo: nil))))
                  return
              }
              do {
                  let decoder = JSONDecoder()
                  //print(String(data: data, encoding: .utf8)) //to see data
                  let result = try decoder.decode(T.self, from: data)
                  completion(.success(result))
              } catch let error {
                  completion(.failure(.decodingError(error)))
              }
          }
          task.resume()
      }

}
