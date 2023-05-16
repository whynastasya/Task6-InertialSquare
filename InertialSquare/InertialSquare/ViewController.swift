//
//  ViewController.swift
//  InertialSquare
//
//  Created by nastasya on 16.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let squareView = UIView()
    private var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        animator = UIDynamicAnimator(referenceView: view)
        setupSquareView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupSquareView() {
        squareView.frame = CGRectMake(0, 0, 100, 100)
        squareView.center = view.center
        squareView.backgroundColor = .white
        squareView.layer.cornerRadius = 8
        setupGradientLayer()
        view.addSubview(squareView)
    }
    
    @objc private func tap(tapGestureRecognizer: UITapGestureRecognizer) {
        animator.removeAllBehaviors()
        let snapBehavior = UISnapBehavior(item: squareView, snapTo: tapGestureRecognizer.location(in: view))
        snapBehavior.damping = 0.6
        animator.addBehavior(snapBehavior)
    }
    
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        gradientLayer.colors = [
            UIColor.purple.cgColor,
            UIColor.systemPink.withAlphaComponent(0.3).cgColor
        ]
        gradientLayer.startPoint = CGPointMake(1, 0)
        gradientLayer.endPoint = CGPointMake(0, 1)
        gradientLayer.cornerRadius = 15
        gradientLayer.masksToBounds = true
        squareView.layer.addSublayer(gradientLayer)
    }
}

