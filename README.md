# Netflix Clone App

This is a Netflix Clone iOS application built entirely with UIKit programmatically.

The app allows users to explore movies and TV shows by fetching data from The Movie Database API (TMDB). 
It displays categories such as trending, popular, top-rated, and upcoming titles. 
The app also integrates WebKit for content previews and uses Core Data for saving favorites locally.

<div style="display: flex; justify-content: center; align-items: center;">
<img src="https://i.postimg.cc/8kdKL7pj/home.png" alt="list.png" width="200">
<img src="https://i.postimg.cc/s2BHWKxr/detail.png" alt="list.png" width="200">
<img src="https://i.postimg.cc/T1xtZ69d/upcoming.png" alt="list.png" width="200">
<img src="https://i.postimg.cc/50LP708K/donwloads.png" alt="list.png" width="200">
</div>

## Features

- **Home Screen:** View trending, popular, top-rated, and upcoming movies and TV shows.
- **Detail View:** See detailed information and preview trailers using WebKit.
- **Favorites:** Save your favorite movies locally using Core Data.
- **API Integration:** Fetch real-time data from TMDB with URLSession.
- **Unit Tests:** Logic tested using XCTest to ensure app stability.
- **UIKit Programmatic UI:** No Storyboards used — all views created in code.

## Technologies

- UIKit (Programmatic)
- Xcode
- WebKit
- URLSession
- The Movie Database API (TMDB)
- Swift


## Installation

1. Clone this repository:
   ```bash
   https://github.com/Heandy27/Netflix-Project.git
   ```
2. Open the project in Xcode.
3. Run the project on a simulator or physical device.

## Usage

### Explore Movies and TV Shows:
When the app launches, you’ll see multiple sections for trending, popular, top-rated, and upcoming content.

### Save Favorites:
Mark a movie or show as a favorite and store it locally with Core Data for offline access.
