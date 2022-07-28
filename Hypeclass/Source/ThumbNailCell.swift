//
//  ThumbnailCell.swift
//  Hypeclass
//
//  Created by 이성노 on 2022/07/28.
//

import UIKit

class ThumbNailCell: UICollectionViewCell {
    
    //MARK: - Properties
    
//    var youtubeModelAPI: YoutubeModelAPI? {
//        didSet {
//            guard var youtubeModelAPI = youtubeModelAPI else { return }
//            mockUpThumbNail.image = youtubeModelAPI.memberImage
//            youtubeTitle.text = youtubeModelAPI.
//        }
//    }
    
    private lazy var mockUpThumbNail: UIImageView = {
        let imageView = UIImageView()
        let dancerProfileImage: UIImage = UIImage(systemName: "person")!
        imageView.image = dancerProfileImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let youtubeTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func setLayout() {
        contentView.addSubview(mockUpThumbNail)
        mockUpThumbNail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        mockUpThumbNail.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(youtubeTitle)
        youtubeTitle.topAnchor.constraint(equalTo: mockUpThumbNail.bottomAnchor, constant: 10).isActive = true
        mockUpThumbNail.leadingAnchor.constraint(equalTo: mockUpThumbNail.leadingAnchor).isActive = true
    }
}
