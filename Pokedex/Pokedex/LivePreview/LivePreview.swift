//
//  LivePreview.swift
//  Pokedex
//
//  Created by Maxwell Farias on 10/04/24.
//

import SwiftUI

class LivePreviewController: UIViewController {
//Adicionar a UIView que que se desejar ver
    let mainView: UIView = SearchTableViewCell()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
    }
    
    private func setup() {
        view.addSubview(mainView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.frame = CGRect(x: view.bounds.minX, y: view.bounds.minY, width: view.bounds.width, height: 90)
    }
}
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LivePreviewController
    
    func makeUIViewController(context: Context) -> LivePreviewController {
        LivePreviewController()
    }
    
    func updateUIViewController(_ uiViewController: LivePreviewController, context: Context) {
        
    }
}
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

