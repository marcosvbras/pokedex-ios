
protocol Mapper {
    
    associatedtype Input
    associatedtype Output
    
    func apply(input: Input) -> Output
}
