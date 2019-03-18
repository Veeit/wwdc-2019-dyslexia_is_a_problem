import PlaygroundSupport
let page = PlaygroundPage.current
page.liveView = BasicGatesViewController()

extension BasicGatesViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case let .string(varsToDisp) = message{
            updateVars(varsToDisp)
        }
    }
}
