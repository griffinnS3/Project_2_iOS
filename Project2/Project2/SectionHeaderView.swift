//
//  SectionHeaderView.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    let label = UILabel()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.backgroundColor = .green
        label.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaInsets)
        }
        contentView.backgroundColor = .systemGray6
    }
    func configure(title: String) {
        label.text = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // Create a UITableViewHeaderFooterView here
class FooterView: UITableViewHeaderFooterView {
    let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.backgroundColor = .black
        label.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaInsets)
        }
    }
   required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(title: String) {
        label.text = title
    }
}
