📱 Feeds App (SwiftUI + Clean Architecture)
Overview
This project is a SwiftUI-based feed application built using Clean Architecture principles.
It displays categorized feeds (Discover, Following, Trending) with a horizontal section selector and dynamically updates posts based on the selected section.
The goal was to create a scalable, testable, and maintainable architecture suitable for production-level iOS apps.

✨ Features

SwiftUI-based UI
Horizontal section selector (Discover / Following / Trending)
Dynamic feed updates per selected section
Async/Await networking
MVVM + Clean Architecture
Reusable UI components
Clear separation of concerns

🏗 Architecture

The project follows Clean Architecture, split into three main layers:

Presentation → Domain → Data

1️⃣ Presentation Layer

Responsible for UI and user interaction.

Includes:

FeedView

FeedsViewModel

Reusable UI components:

FeedSectionSelectorView

FeedPostCardView

Responsibilities:

Rendering UI

Handling user interactions

Observing ViewModel state

2️⃣ Domain Layer

Contains business logic and core models, independent of frameworks.

Includes:

Entities: FeedSection, Post, User

Use case protocols

Repository protocols

Why:

Keeps business rules isolated

Makes the app testable and framework-agnostic

3️⃣ Data Layer

Handles data fetching and transformation.

Includes:

DTOs (FeedSectionDTO, PostDTO, etc.)

Mappers (DTO → Domain)

Repository implementations

Remote data sources

Why DTOs?

DTOs mirror API responses exactly

Domain models remain clean and stable

Prevents API changes from affecting UI/business logic

📂 Project Structure
App
├── Presentation
│   └── Feed
│       ├── FeedView.swift
│       ├── FeedsViewModel.swift
│       └── Components
│           ├── FeedSectionSelectorView.swift
│           └── FeedPostCardView.swift
│
├── Domain
│   ├── Entities
│   ├── UseCases
│   └── Repositories
│
└── Data
    ├── DTO
    ├── Mappers
    ├── Repositories
    └── NetworkService

🔄 Data Flow
API Response
   ↓
DTO (Data Layer)
   ↓
Mapper
   ↓
Domain Entity
   ↓
Use Case
   ↓
ViewModel
   ↓
SwiftUI View

This ensures:
No API logic leaks into UI



Strong separation of concerns

Easy testing and future extension



📌 Conclusion

This project demonstrates:
Clean Architecture in SwiftUI
Proper DTO usage
Scalable MVVM design
Modern async/await patterns
It is designed to be easy to understand, easy to extend, and production-ready



✅ 2. SOLID Principles

The project adheres to SOLID principles as follows:

S — Single Responsibility Principle

Views only handle UI rendering

ViewModels only manage state and orchestration

Use cases handle one specific business action

DTOs only represent API data

O — Open / Closed Principle

New feed sources or features can be added without modifying existing code

Repositories can be extended with new implementations

L — Liskov Substitution Principle

Repository implementations can be swapped without affecting consumers

Mocks conform to the same protocols as real implementations

I — Interface Segregation Principle

Repository and use case protocols expose only required methods

No unnecessary dependencies are forced on consumers

D — Dependency Inversion Principle

High-level modules (ViewModels, Use Cases) depend on protocols

Concrete implementations are injected at runtime
