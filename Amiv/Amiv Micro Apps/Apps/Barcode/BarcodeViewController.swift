//
//  BarcodeViewController.swift
//  Amiv
//
//  Created by Denis Zuppiger on 12.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


public class BarcodeViewController: UIViewController {
    public var delegate: BarcodeViewControllerDelegate?
    
    public private(set) var titleLabel: UILabel!
    public private(set) var barcodeLabel: UIImage!
    public private(set) var barcodeLabelView: UIImageView!
    public private(set) var button: UIButton!
    public private(set) var textView: UITextView!
    public private(set) var brightness: CGFloat!
    
    public init(model: AmivMicroAppModel){
        super.init(nibName: nil, bundle: nil)
        self.title = model.title
        
        brightness = UIScreen.main.brightness
        UIScreen.main.brightness = 1.0
        // UI
        self.titleLabel = self.createTitleLabel()
        self.view.addSubview(self.titleLabel)
        
        let leftBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.barcodeLabel = UIImage(cgImage: self.createBarcodeLabel().cgImage! ,scale: 0.1 ,orientation: UIImage.Orientation.right)
        self.barcodeLabel = RSAbstractCodeGenerator.resizeImage(self.barcodeLabel, targetSize: self.barcodeLabel.size, contentMode: .scaleToFill)
        self.barcodeLabelView = UIImageView()
        self.barcodeLabelView.image = self.barcodeLabel
        self.barcodeLabelView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.barcodeLabelView)
        
        // Layout
        self.navigationItem.leftBarButtonItem?.tintColor = .amivRed
        self.setLabelLayout()
        self.setBarcodeLabelLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.text = "LEGI-BARCODE:"
        label.textColor = .amivRed
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setLabelLayout(){
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func checkBestString(user: User) -> String {
        if let legi = user.legi {
            return legi
        }
        if let nethz = user.nethz {
            return nethz
        }
        // there is no @ in Code 39 so we use " " (be sure to implement that in the checktin app
        return user.email.replacingOccurrences(of: "@", with: " ")
    }
    
    private func createBarcodeLabel() -> UIImage {
        let errorImage = UIImage(named: "xcode_error_icon")
        guard let user = User.loadLocal() else {
            debugPrint("no user")
            return errorImage!
        }
        // Code 39 Generator Library RSBarcodes (accepts only uppercase letters)
        guard let barcode = RSUnifiedCodeGenerator.shared.generateCode(self.checkBestString(user: user).uppercased(), machineReadableCodeObjectType: AVMetadataObject.ObjectType.code39.rawValue) else {
            debugPrint("wrong string")
            return errorImage!
        }
        return barcode
    }
    
    private func setBarcodeLabelLayout(){
        NSLayoutConstraint(item: self.barcodeLabelView, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.barcodeLabelView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.barcodeLabelView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.barcodeLabelView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    @objc private func goBack() {
        UIScreen.main.brightness = brightness
        dismiss(animated: true, completion: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .white
    }
}
