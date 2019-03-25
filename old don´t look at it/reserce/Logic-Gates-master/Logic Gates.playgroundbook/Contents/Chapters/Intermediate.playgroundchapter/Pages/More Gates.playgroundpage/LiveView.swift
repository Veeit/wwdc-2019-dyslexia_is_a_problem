import PlaygroundSupport
let page = PlaygroundPage.current
page.liveView = MoreGatesViewController()

extension MoreGatesViewController: PlaygroundLiveViewMessageHandler {
    public func receive(_ message: PlaygroundValue) {
        if case let .string(varsToDisp) = message{
            updateVars(varsToDisp)
        }
    }
}
