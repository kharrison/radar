import UIKit
import PlaygroundSupport

let vc = GridController()
vc.view.frame = CGRect(x: 0, y: 0, width: 320, height: 640)
vc.view.backgroundColor = .green

PlaygroundPage.current.liveView = vc.view
