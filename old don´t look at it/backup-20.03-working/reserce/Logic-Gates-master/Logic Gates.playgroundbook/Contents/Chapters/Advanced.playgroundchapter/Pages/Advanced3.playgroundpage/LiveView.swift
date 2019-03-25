import PlaygroundSupport

let page = PlaygroundPage.current
page.liveView = AdvancedPage3ViewController()

extension AdvancedPage3ViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case let .string(varsToDisp) = message{
            updateVars(varsToDisp)
        }
        if case let .integer(cost) = message{
            updateCost(cost)
        }
    }
}
