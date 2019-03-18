import PlaygroundSupport
let page = PlaygroundPage.current
page.liveView = AbstractProblemViewController()

extension AbstractProblemViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case let .string(varsToDisp) = message{
            updateVars(varsToDisp)
        }
    }
}
