# Trendyol Demo App

A demonstration iOS application showcasing the VIPER architecture pattern (View–Interactor–Presenter–Entity–Router) implemented in Swift. The project features a product listing and detail view integrated with Trendyol's API, demonstrating clean separation of responsibilities, testable components, and professional iOS development practices.

## Overview

This native iOS application built with Swift and UIKit demonstrates clean architecture principles using the VIPER pattern. The app fetches and displays widgets containing products and banners, providing a smooth browsing experience with product details and image galleries.

## Features

- **Product Listing**: Horizontally scrollable product sliders organized by widgets
- **Banner Display**: Single banner sections for promotions
- **Product Details**: Dedicated detail view with image gallery and product information
- **Image Gallery**: Swipeable image carousel with page indicators
- **Loading States**: Visual feedback during network operations
- **Error Handling**: User-friendly error messages for network failures
- **Network Layer**: Clean abstraction using URLSession with protocol-oriented design
- **Image Caching**: Efficient image loading and caching via Kingfisher

## Architecture

This project implements the **VIPER** (View-Interactor-Presenter-Entity-Router) architecture pattern, providing clear separation of concerns:

- **View**: Displays UI and handles user interactions (`ListViewController`, `DetailViewController`)
- **Interactor**: Contains business logic and data fetching operations
- **Presenter**: Acts as intermediary between View and Interactor, preparing data for display
- **Entity**: Plain data models (structs conforming to Codable)
- **Router (Wireframe)**: Handles navigation and module assembly with dependency injection

## Tech Stack

- **Language**: Swift 5+
- **UI Framework**: UIKit with Storyboards
- **Networking**: URLSession
- **JSON Parsing**: Codable protocol
- **Image Loading**: Kingfisher (~> 5.0)
- **Minimum Deployment Target**: iOS 13.0+
- **Dependency Management**: CocoaPods

## Usage

### Browsing Products

1. Launch the app to see the product listing screen
2. Scroll vertically to browse different widget sections
3. Scroll horizontally within each product slider to view more products
4. Tap on any product to view its details

### Viewing Product Details

1. On the detail screen, swipe through the image gallery
2. View product information including brand, name, and price
3. Use the page indicator to track your position in the gallery
4. Navigate back using the navigation bar

## API Integration

The app fetches data from Trendyol's API:
```
Endpoint: https://api.trendyol.com/zeus/widget/display?widgetPageName=interview
```

Response includes:
- Widget configurations
- Product information (images, prices, brands)
- Banner content
- Navigation metadata

## Key Design Patterns

- **VIPER Architecture**: Separation of concerns across five layers
- **Protocol-Oriented Programming**: Loose coupling through protocol definitions
- **Dependency Injection**: Wireframe pattern for module assembly
- **Generic Programming**: Reusable API client implementation
- **Singleton Pattern**: Shared UI manager for loading indicators

## Dependencies

### CocoaPods

- **Kingfisher** (~> 5.0): High-performance image downloading and caching library


