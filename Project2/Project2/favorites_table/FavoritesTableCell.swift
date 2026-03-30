//
//  FavoritesTableCell.swift
//  Project2
//
//  Created by Eddie Slobodow on 3/26/26.
//

import UIKit
import SnapKit

class FavoritesTableCell: UITableViewCell {
    let title = UILabel()
    let image = UIImageView()
    let content = UILabel()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.backgroundColor = .white
        title.textColor = .black
        title.textAlignment = .center
        
        contentView.addSubview(title)
        contentView.addSubview(image)
        if content.text != nil {
            contentView.addSubview(content)
        }
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(image.snp.left)
        }
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalToSuperview().multipliedBy(0.50)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
            super.prepareForReuse()
            
            title.text = nil
            image.image = nil
            
            image.isHidden = false
        }
    func configure(vm: Favorite) {
        
        // I use this function to determain what type of object is being passed
        // and set the data accordingly
        title.text = vm.title
        
        if let destination = vm as? Destination {
            image.image = destination.image
        } else if vm is Tours {

        } else if let note = vm as? Note {
            content.text = note.content
        }
    }
}
