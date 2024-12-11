//
//  MainView.swift
//  AlamofireApp
//
//  Created by Daniil on 11.12.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        
            Text("Hello, world!")
            .onAppear {
                viewModel.onAppearHandler()
            }
        
    }
}

#Preview {
    MainView()
}


