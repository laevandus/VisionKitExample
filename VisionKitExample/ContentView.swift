//
//  ContentView.swift
//  VisionKitExample
//
//  Created by Toomas Vahter on 03.07.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import SwiftUI
import UIKit
import Vision
import VisionKit

struct ContentView: View {
    private let buttonInsets = EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Vision Kit Example")
            Button(action: openCamera) {
                Text("Scan").foregroundColor(.white)
            }.padding(buttonInsets)
                .background(Color.blue)
                .cornerRadius(3.0)
            Text(text).lineLimit(nil)
        }.sheet(isPresented: self.$isShowingScannerSheet) { self.makeScannerView() }
    }
    
    @State private var isShowingScannerSheet = false
    @State private var text: String = ""
    
    private func openCamera() {
        isShowingScannerSheet = true
    }
    
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: { textPerPage in
            if let text = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                self.text = text
            }
            self.isShowingScannerSheet = false
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
