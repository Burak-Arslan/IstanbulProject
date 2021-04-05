
import UIKit
import Lottie
import RxSwift
import RxCocoa


class ViewController: BaseVC<SplashVM> {
    
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "map")
        animationView?.frame = view.bounds
        view.addSubview(animationView!)
        animationView!.play(
            fromProgress: animationView?.currentProgress,
            toProgress: 1,
            loopMode: .playOnce,
            completion: { [weak self] completed in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    self?.viewModel?.goMain.onNext(true)
                }
            }
        )
    }
}

