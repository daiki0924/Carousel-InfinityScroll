//
//  CarouselView.swift
//  Carousel
//
//  Created by 小林大希 on 2020/07/26.
//  Copyright © 2020 小林大希. All rights reserved.
//

import UIKit

class CarouselView: UICollectionView {
    var cellItemsWidth: CGFloat = 0.0
    let isInfinity = true
    let pageCount: Int = 5
    let colors: [UIColor] = [.red, .blue, .yellow, .green, .gray]
    
    convenience init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: frame.height / 2)
        layout.scrollDirection = .horizontal
        self.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(CarouselCell.self, forCellWithReuseIdentifier: "carousel")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarouselView: UICollectionViewDelegate {
    
}

extension CarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isInfinity ? pageCount * 3 : pageCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "carousel", for: indexPath) as! CarouselCell
        configureCell(cell: cell, indexPath: indexPath)
        print("cellSize: \(cell.frame.size.width * CGFloat(pageCount * 3))")
        return cell
    }
    
    func configureCell(cell: CarouselCell, indexPath: IndexPath) {
        let fixedIndex = isInfinity ? indexPath.item % pageCount : indexPath.item
        cell.contentView.backgroundColor = colors[fixedIndex]
    }
}

extension CarouselView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isInfinity {
            if cellItemsWidth == 0.0 {
                // セル5個で1ページを3ページ表示しているため、3.0で割る
                // cellItemsWidth には1ページ分の width が入る
                cellItemsWidth = floor(scrollView.contentSize.width / 3.0)
            }
            
            // scroll位置が0以下、または、3ページ目のスクロールが始まるくらいの位置になったら、スクロール位置を2ページ目に戻す
            if scrollView.contentOffset.x <= 0.0 || scrollView.contentOffset.x > cellItemsWidth * 2.0 {
                scrollView.contentOffset.x = cellItemsWidth
            }
        }
    }
}
