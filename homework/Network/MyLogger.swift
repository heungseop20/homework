//
//  MyLogger.swift
//  homework
//
//  Created by heungseop sim on 2022/07/08.
//

import Foundation
import Alamofire

final class MyLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "MyLogger")
    
    func requestDidResume(_ request: Request) {
        print("MyLogger - requestDidResume()")
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("MyLogger - request.didParseResponse()")
        debugPrint(response)
    }
    
    
}
