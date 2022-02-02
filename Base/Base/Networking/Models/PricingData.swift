//
//  PricingData.swift
//  produto-enjoei
//
//  Created by Marcos Vinicius Majeveski De Angeli on 22/10/21.

import Foundation

// MARK: - Pricing
/// The Pricing data received as JSON
public struct PricingData: Codable {
    public let id: Int?
    public let offer: PricingOffer?
    public let purchase: PricingPurchase?
    public let regularPrice: PricingRegularPrice?
    public let flashMessage: PricingFlashMessage?
    public let variations: PricingVariations?
    public let serviceTax: Int?
}

// MARK: - PricingFlashMessage
public struct PricingFlashMessage: Codable {
    public let title: String?
    public let subtitle: String?
    public let colors: PricingFlashMessageColors?
    public let icon: String?
}

// MARK: - PricingFlashMessageColors
public struct PricingFlashMessageColors: Codable {
    public let title: String?
    public let subtitle: String?
    public let background: String?
}

// MARK: - PricingOffer
public struct PricingOffer: Codable {
    public let available: Bool?
    public let unavailableReason: String?
    public let minPrice: Int?
    public let maxPrice: Int?
    public let state: String?
}

// MARK: - PricingPurchase
public struct PricingPurchase: Codable {
    public let state: String?
    public let unavailableReason: String?
    public let canSellWithBundle: Bool?
    public let bundleAllowed: Bool?
    public let bankslipAvailable: Bool?
    public let pixAvailable: Bool?
    public let paymentOptionsDescription: String?
}

// MARK: - PricingRegularPrice
public struct PricingRegularPrice: Codable {
    public let colors: PricingColorsClassesClass?
    public let colorsClasses: PricingColorsClassesClass?
    public let values: PricingValues?
}

// MARK: - PricingColorsClassesClass
public struct PricingColorsClassesClass: Codable {
    public let tagBackground: String?
    public let tagText: String?
    //let timerBackground: NSNull? - Could not infer the type for this property
    public let timerText: String?
    public let discountText: String?
    public let discountBackground: String?
    public let salePriceText: String?
}

// MARK: - PricingValues
public struct PricingValues: Codable {
    public let discount: Int?
    public let tagText: String?
    public let timerText: String?
    //let expiresAt: NSNull? - Could not infer the type for this property
    //let format: NSNull? - Could not infer the type for this property
    public let priceSubtitle: String?
    public let price: PricingPrice?
}

// MARK: - PricingPrice
public struct PricingPrice: Codable {
    public let listed: Int?
    public let sale: Int?
}

// MARK: - PricingVariations
public struct PricingVariations: Codable {
    public let labels: PricingLabels?
    //let currentSelection: NSNull? - Could not infer the type for this property
    public let options: [PricingOption]?
}

// MARK: - PricingLabels
public struct PricingLabels: Codable {
    public let titleSingular: String?
    public let titlePlural: String?
    public let chooseOne: String?
    public let chooseAnother: String?
    public let unavailable: String?
    public let edit: String?
    public let tag: String?
}

// MARK: - PricingOption
public struct PricingOption: Codable {
    public let slug: String?
    public let name: String?
    public let tag: String?
    public let available: Bool?
}
