

import Foundation
import UIKit

class Coordinator {
    let factory = Factory()
    var navigator : UINavigationController
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func startList(){
        let viewModel = ListViewModel(apiManager: factory.apiManager, coordinator: self)
        let viewController = ListViewController(viewModel: viewModel)
        navigator.setViewControllers([viewController], animated: true)
    }
    func detail(pokemon: Pokemon, imageData: Data){
        let viewModel = DetailViewModel(pokemon: pokemon, imageData: imageData)
        let viewController = DetailViewController(viewModel: viewModel)
        navigator.show(viewController, sender: nil)
    }
}
