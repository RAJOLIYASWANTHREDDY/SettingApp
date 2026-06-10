//
//  MockNetworkManager.swift
//  RickAndMorty
//
//  Created by yaswanth reddy on 6/9/26.
//

final class MockNetworkManager: Sendable, NetworkProtocol {
    
    static let sharedInstance = MockNetworkManager()
    private init() {}
    
    func getDataFromServer(for url: String) -> [Setting?] {
        var settingList:[Setting] = []
 
        let setting1 = Setting(title: "About", iconName: "questionmark.square")
        let setting2 = Setting(title: "Screen Capture", iconName: "camera.viewfinder")
        
        settingList.append(setting1)
        settingList.append(setting2)
       
        return settingList
    }
}
