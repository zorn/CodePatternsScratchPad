import Foundation

enum WebServiceResult {
    case Success(String)
    case Error(Int)
}

private func sampleCode() {
    let result = downloadWebContent()

    switch result {
    case .Success(let content):
        print("Success content: \(content)")
    case .Error(let errorCode):
        print("Error code: \(errorCode)")
        
    }
}

private func downloadWebContent() -> WebServiceResult {
    let answer = WebServiceResult.Success("Phillies Win!")
    return answer
}
