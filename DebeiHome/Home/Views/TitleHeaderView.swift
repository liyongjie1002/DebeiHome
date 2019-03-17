//
//  TitleHeaderView.swift
//  DebeiHome
//
//  Created by 李永杰 on 2019/3/16.
//  Copyright © 2019 Y了个J. All rights reserved.
//

import UIKit

class TitleHeaderView: UICollectionReusableView {
    var headerTitle: String? {
        didSet {
            titleLabel.text = headerTitle
        }
    }
    var tipTitle: String? {
        didSet {
            tipButton.isHidden = false
            tipButton.setTitle(tipTitle, for: .normal)
        }
    }
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width - 100, height: self.frame.size.height))
        return label
    }()
    lazy var tipButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("提示", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: self.frame.width - 100, y: 0, width: 100, height: self.frame.size.height)
        button.isHidden = true
        button.addTarget(self, action: #selector(clickTipButton), for: .touchUpInside)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configUI () {
        addSubview(titleLabel)
        addSubview(tipButton)
    }
    @objc func clickTipButton()  {
        print("点了=====\(headerTitle!)")
    }
}
