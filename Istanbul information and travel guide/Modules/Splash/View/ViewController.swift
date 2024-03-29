
import UIKit
import Lottie
import RxSwift
import RxCocoa


class ViewController: BaseVC<SplashVM> {
    
    var animationViewSplash: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        animationViewSplash = .init(name: "map")
        animationViewSplash?.frame = view.bounds
        view.addSubview(animationViewSplash!)
        animationViewSplash!.play(
            fromProgress: animationViewSplash?.currentProgress,
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

