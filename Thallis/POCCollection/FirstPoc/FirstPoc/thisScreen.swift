//
//  thisScreen.swift
//  FirstPoc
//
//  Created by Thallis Sousa on 28/09/22.
//

import Foundation
import UIKit

class thisScreen: UIView {
    
    private let title: UILabel = CustomViews.newLabel()

    private var dynamicConstraint: [NSLayoutConstraint] = []

    
    
    init() {
        super.init(frame: .zero)
        
        setupConstraints()
        self.addSubview(title)
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.deactivate(self.dynamicConstraint)
        
        self.dynamicConstraint = ([
        self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
        self.title.heightAnchor.constraint(equalToConstant: 30),
        ])
        NSLayoutConstraint.activate(self.dynamicConstraint)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented)")}

}
