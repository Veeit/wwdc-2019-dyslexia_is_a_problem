import PlaygroundSupport
let page = PlaygroundPage.current
page.liveView = RealProblemViewController()

extension RealProblemViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case let .string(varsToDisp) = message{
            updateVars(varsToDisp)
        }
    }
}
