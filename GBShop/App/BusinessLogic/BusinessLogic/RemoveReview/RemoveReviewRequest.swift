//
//  RemoveReviewRequest.swift
//  GBShop
//
//  Created by Марат Нургалиев on 07/05/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Alamofire

class RemoveReviewRequest: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    
    let sessionManager: SessionManager
    
    let queue: DispatchQueue?
    
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    
    init(errorParser: AbstractErrorParser,
         sessionManager: SessionManager,
         queue: DispatchQueue? = DispatchQueue.global(qos: .utility)) {
        
        self.errorParser = errorParser
        
        self.sessionManager = sessionManager
        
        self.queue = queue
    }
    
}

extension RemoveReviewRequest: RemoveReviewRequestFactory {
    
    func removeReview(id: Int, completionHandler: @escaping (DataResponse<RemoveReviewResult>) -> Void) {
        
        let requestModel = RemoveReviewRequest(baseUrl: baseUrl, idReview: id)
        
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
}

extension RemoveReviewRequest {
    
    struct RemoveReviewRequest: RequestRouter {
        
        let baseUrl: URL
        
        let method: HTTPMethod = .get
        
        let path: String = "removeReview.json"
        
        let idReview: Int
        
        var parameters: Parameters? {
            
            return [
                "id_review" : idReview
            ]
            
        }
        
    }
    
}

