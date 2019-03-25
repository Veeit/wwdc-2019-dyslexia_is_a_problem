import PlaygroundSupport
let page = PlaygroundPage.current
page.liveView = BuildXORViewController()

extension BuildXORViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case let .string(varsToDisp) = message{
            updateVars(varsToDisp)
        }
    }
}
