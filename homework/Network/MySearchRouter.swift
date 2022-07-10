//
//  MySearchRouter.swift
//  homework
//
//  Created by heungseop sim on 2022/07/08.
//

import Foundation
import Alamofire

// 검색관련 api
enum MySearchRouter: URLRequestConvertible {
    
    case searchPhotos(term: String)
    case searchUsers(term: String)

    var baseURL: URL {
        return URL(string: API.BASE_URL + "search/")!
    }

    var method: HTTPMethod {
        
        switch self {
        case .searchPhotos, .searchUsers:
            return .get
        }
    }

    var endPoint: String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    var parameters : [String: String] {
        
        //        switch self {
        //        case let .searchUsers(term):
        //            return ["query1" : term + ""]
        //        case let .searchPhotos(term):
        //            return ["query2" : term]
        //        }
        switch self {
        case let .searchUsers(term), let .searchPhotos(term):
            return ["query" : term]
        }
   
    }

    func asURLRequest() throws -> URLRequest {
        
        let url = baseURL.appendingPathComponent(endPoint)
        
        print("MySearchRouter - asURLRequest() url : \(url)")
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        
        return request
    }
}
