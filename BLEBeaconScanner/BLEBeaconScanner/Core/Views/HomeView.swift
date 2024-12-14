//
//  HomeView.swift
//  BLEBeaconScanner
//
//  Created by Laxman Singh Koranga on 12/07/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var bluetoothManager = BluetoothManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if bluetoothManager.isBluetoothOn {
                    List(bluetoothManager.discoveredPeripherals, id: \.identifier) { peripheral in
                        Text(peripheral.name ?? "Unknown")
                            .fontDesign(.serif)
                            .fontWeight(.semibold)
                            .frame(width: 350, height: 50, alignment: .center)
                    }
                } else {
                    Text("Bluetooth is off. Enable to scan devices.")
                        .fontDesign(.serif)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .frame(width: 350, height: 50, alignment: .center)
                }
            }
            .navigationTitle("BLE Devices")
        }
    }
}

#Preview {
    HomeView()
}
