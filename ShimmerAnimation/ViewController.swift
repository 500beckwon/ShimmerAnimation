//
//  ViewController.swift
//  ShimmerAnimation
//
//  Created by ByungHoon Ann on 2022/09/24.
//

import UIKit
import ShimmerSwift

//Shimmer = "반짝임"
//https://github.com/BeauNouvelle/ShimmerSwift
//https://www.youtube.com/watch?v=70gKWkz5nXs&list=LL&index=1&t=44s

class ViewController: UIViewController {
    let button = UIButton()
    let stackView = UIStackView()
    let speedSlider = UISlider()
    let speedLabel = UILabel()
    let opacitySlider = UISlider()
    let opacitySliderLabel = UILabel()
    
    let shimmerView = ShimmeringView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertUI()
        basicSetUI()
        anchorUI()
        
        
    }
    
    @objc func speedSliderValueChange(_ sender: UISlider) {
        let value = floor(CGFloat(sender.value * 10))/10
        shimmerView.shimmerSpeed = value
        speedLabel.text = "Speed \(value)"
    }
    
    @objc func opacitySliderValueChagne(_ sender: UISlider) {
        let value = floor(CGFloat(sender.value * 10))/10
        shimmerView.shimmerOpacity = value
        opacitySliderLabel.text = "Opacity \(value)"
    }

    func insertUI() {
        view.addSubview(shimmerView)
        shimmerView.addSubview(button)
        view.addSubview(stackView)
        stackView.addArrangedSubview(speedSlider)
        stackView.addArrangedSubview(speedLabel)
        stackView.addArrangedSubview(opacitySlider)
        stackView.addArrangedSubview(opacitySliderLabel)
    }
    
    func basicSetUI() {
        button.backgroundColor = . link
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        
        shimmerView.contentView = button
        shimmerView.shimmerSpeed = 10
        shimmerView.isShimmering = true
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        
        speedLabel.text = "Speed 230"
        opacitySliderLabel.text = "Opacity 1"
        speedSlider.maximumValue = 230
        speedSlider.minimumValue = 0
        speedSlider.value = 230
        speedSlider.minimumTrackTintColor = .link
        speedSlider.thumbTintColor = .black
        speedSlider.addTarget(self, action: #selector(speedSliderValueChange(_:)), for: .valueChanged)
        
        opacitySlider.value = 1
        opacitySlider.maximumValue = 1
        opacitySlider.minimumValue = 0
        opacitySlider.minimumTrackTintColor = .link
        opacitySlider.thumbTintColor = .black
        opacitySlider.addTarget(self, action: #selector(opacitySliderValueChagne(_:)), for: .valueChanged)

    }
    
    func anchorUI() {
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        shimmerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shimmerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        shimmerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        shimmerView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: shimmerView.leadingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: shimmerView.topAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: shimmerView.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: shimmerView.bottomAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackView.topAnchor.constraint(equalTo: shimmerView.bottomAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }

}

