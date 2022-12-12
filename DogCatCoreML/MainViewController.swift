//
//  MainViewController.swift
//  DogCatCoreML
//
//  Created by zoa0945 on 2022/10/17.
//

import UIKit
import SnapKit

// TODO: [ ] precision과 recall의 차이점
// precision: ML모델이 참이라고 판단한 값들 중 실제로 참인 값들의 비율
// recall: 실제로 참인 값들 중 ML모델이 참이라고 판단한 비율
class MainViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private let toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        let barButtonItem = UIBarButtonItem(systemItem: .camera)
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        toolBar.setItems([barButtonItem, flexibleSpace], animated: true)
        
        return toolBar
    }()
    
    private let visualEffectView: UIVisualEffectView = {
        let visualView = UIVisualEffectView()
        visualView.contentMode = .scaleToFill
        visualView.backgroundColor = .white
        
        return visualView
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "label"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
}

extension MainViewController {
    private func layout() {
        [
            imageView,
            visualEffectView,
            toolBar
        ].forEach {
            view.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        visualEffectView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.lessThanOrEqualTo(16)
            $0.width.equalTo(173)
            $0.height.equalTo(60)
        }
        
        toolBar.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(visualEffectView.snp.bottom).offset(16)
        }
        
        visualEffectView.contentView.addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
