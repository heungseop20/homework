//
//  MyApiStatusLogger.swift
//  homework
//
//  Created by heungseop sim on 2022/07/08.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("MyApiStatusLogger - requestDidResume()")
////        debugPrint(request)
//    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
        
        print("MyApiStatusLogger - request.didParseResponse() / statusCode : \(statusCode)")
        
        
//        debugPrint(response)
    }
    
    
}
