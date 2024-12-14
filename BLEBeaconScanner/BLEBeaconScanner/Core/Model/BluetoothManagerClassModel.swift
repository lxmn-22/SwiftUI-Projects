//
//  BluetoothManagerClassModel.swift
//  BLEBeaconScanner
//
//  Created by Laxman Singh Koranga on 12/07/2024.
//

import Foundation
import CoreBluetooth

class BluetoothManagerViewModel: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published var isBluetoothOn = false
    @Published var discoveredPeripherals: [CBPeripheral] = []
    
    private var centralManager: CBCentralManager!
    
    override init() {
        super.init()
        print("Initializing BluetoothManager")
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    // tells the delgate the central manager's state updated.
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
//        print("Central Manager did update state: \(central.state.rawValue)")
//        isBluetoothOn = central.state == .poweredOn
//        
//        if isBluetoothOn {
//            print("Bluetooth is powered on, starting scan")
//            centralManager.scanForPeripherals(withServices: nil, options: nil)
//        }
        switch central.state {
        case .unknown:
            print("Bluetooth status is UNKNOWN")
        case .resetting:
            print("Bluetooth status is RESETTING")
        case .unsupported:
            print("Bluetooth status is UNSUPPORTED")
        case .unauthorized:
            print("Bluetooth status is UNAUTHORIZED")
        case .poweredOff:
            print("Bluetooth status is POWERED OFF")
        case .poweredOn:
            print("Bluetooth status is POWERED ON")
            isBluetoothOn = true
            centralManager?.scanForPeripherals(withServices: nil, options: nil)
        @unknown default:
            fatalError("A new state is available that is not yet handled.")
        }
    }
    
    // tells the delegate the central manager discovered a peripheral while scanning for devices.
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        print("Discovered peripheral: \(peripheral.name ?? "UNKNOWN")")

        if !discoveredPeripherals.contains(peripheral) {
            discoveredPeripherals.append(peripheral)
        }
    }
}
