//
//  BeerListCell.swift
//  Brewery
//
//  Created by YONGCHEOL LEE on 2021/12/01.
//

import UIKit
import SnapKit
import Kingfisher

class BeerListCell: UITableViewCell {
    
    let beerImageVIew = UIImageView()
    let nameLabel = UILabel()
    let taglineLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [beerImageVIew, nameLabel, taglineLabel].forEach {
            contentView.addSubview($0)
        }
        
        beerImageVIew.contentMode = .scaleAspectFit
        
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        nameLabel.numberOfLines = 2
        
        taglineLabel.font = .systemFont(ofSize: 14, weight: .light)
        taglineLabel.textColor = .systemBlue
        taglineLabel.numberOfLines = 0
        
        beerImageVIew.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(120)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(beerImageVIew.snp.trailing).offset(10)
            $0.bottom.equalTo(beerImageVIew.snp.centerY)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        taglineLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
    }
    
    func configure(with beer: Beer) {
        let imageURL = URL(string: beer.imageURL ?? "")
        beerImageVIew.kf.setImage(with: imageURL, placeholder: #imageLiteral(resourceName: "beer_icon"))
        nameLabel.text = beer.name ?? "이름 없는 맥주"
        taglineLabel.text = beer.tagLine
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }
}
