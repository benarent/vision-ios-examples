//
//  CollisionObjectView.swift
//  demo
//
//  Created by Maksim on 10/19/18.
//  Copyright © 2018 Mapbox. All rights reserved.
//

import Foundation
import UIKit

private let collisionColor = UIColor(red: 1.0, green: 0, blue: 55/255.0, alpha: 1.0)

final class CollisionObjectView: UIView {
    
    private let imageView = UIImageView(image: Asset.Assets.alert.image)
    
    private var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    init() {
        super.init(frame: .zero)
        
        isHidden = true
        backgroundColor = .clear
        
        gradientLayer?.colors = [collisionColor.withAlphaComponent(0.64).cgColor, collisionColor.withAlphaComponent(0.45).cgColor, UIColor.clear.cgColor]
        gradientLayer?.backgroundColor = UIColor.clear.cgColor
        gradientLayer?.locations = [0.0, 0.75, 1.0]
        gradientLayer?.type = "radial"
        gradientLayer?.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ frame: CGRect) {
        self.frame = frame
    }
}
