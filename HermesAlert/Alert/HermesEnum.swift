//
//  HermesEnum.swift
//  Hermes
//
//  Created by Alessandro Marcon on 20/11/2020.
//

import Foundation

//MARK: - Alert types
public enum HermesAlertType {
    case simple
    case twoButtons
    case instagram
    case checkbox
    case textfield
}

//MARK: - Icon set
public enum AlertIconType: String {
    case information
    case warning
    case error
    case success
}

public enum HermesParam {
    case reason
    case checked
    case textValue
}
