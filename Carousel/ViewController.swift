//
//  ViewController.swift
//  Carousel
//
//  Created by 小林大希 on 2020/07/26.
//  Copyright © 2020 小林大希. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var safearea: UILayoutGuide!
    var carousel: CarouselView!
    
    override func loadView() {
        super.loadView()
        safearea = view.safeAreaLayoutGuide
        let width: CGFloat = view.frame.size.width
        let height: CGFloat = view.frame.size.height
        carousel = CarouselView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        view.addSubview(carousel)
        carousel.translatesAutoresizingMaskIntoConstraints = false
        carousel.topAnchor.constraint(equalTo: safearea.topAnchor).isActive = true
        carousel.bottomAnchor.constraint(equalTo: safearea.bottomAnchor).isActive = true
        carousel.leftAnchor.constraint(equalTo: safearea.leftAnchor).isActive = true
        carousel.rightAnchor.constraint(equalTo: safearea.rightAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

