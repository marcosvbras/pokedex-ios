
protocol UseCase {
    
    associatedtype Params
    associatedtype Outcome
    
    func execute(params: Params) -> Outcome
}
