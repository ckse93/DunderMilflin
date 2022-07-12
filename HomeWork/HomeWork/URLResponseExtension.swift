//
//  URLResponseExtension.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import Foundation

extension URLResponse {
    func getStatusCode() -> Int {
        let httpResponse = self as! HTTPURLResponse  // the URLResponse object you get back is actually an instance of the HTTPURLResponse class, so force unwrapping is safe here
        return httpResponse.statusCode
    }
}
