//
//  MainViewModel.swift
//  AlamofireApp
//
//  Created by Daniil on 11.12.2024.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    private let networkService = NetworkService()
    
    func onAppearHandler() {
        networkService.onAppearHandler()
    }
}
