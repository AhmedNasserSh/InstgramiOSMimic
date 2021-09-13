//
//  ImageDownloadQueue.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 12/09/2021.
//

import Foundation
class ImageDownloadQueue {
    private let operationQueue = OperationQueue()
    private var operations = [PostImageDownloadOperation]()
    
    init() {
        operationQueue.maxConcurrentOperationCount = 1
    }
    
    func addOperation(operation: PostImageDownloadOperation) {
        operationQueue.addOperation(operation)
        operations.append(operation)
    }
    
    func cancelOperation(index: Int){
        guard  index < operations.count else{return}
        let operation = operations[index]
        operation.cancel()
    }
    
    func getOperation(operation: PostImageDownloadOperation) -> Int? {
        return operations.firstIndex(of: operation)
    }
    
    
}
