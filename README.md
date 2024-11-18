# Recipe-App

### Steps to Run the App

git clone https://github.com/ibarotparth/Recipe-App.git

Open Xcode Project.

Choose the target simulator or a connected device.

Press Cmd + R to build and run the app in the selected environment.

###Focus Areas

Key Areas Prioritized:

UI/UX: I focused on a clean and user-friendly UI that displays the recipes with relevant information like name, photo, and cuisine type.
Efficient Data Fetching & Image Caching: I prioritized minimizing unnecessary network usage by only loading recipe data when required (on app launch or manual refresh). For images, I implemented caching to reduce redundant network requests.
Unit Testing: A core focus was placed on writing unit tests to ensure the reliability of the app, particularly testing the recipe fetching functionality, data handling, and error handling.

Why These Areas:
UI/UX: I wanted to ensure that users have a smooth experience when interacting with the app, with intuitive navigation and clear recipe details.
Network Efficiency: Given the potentially large size of images and recipes, I aimed to minimize bandwidth usage by caching images and reducing unnecessary API calls.
Unit Testing: To ensure the app functions correctly, I wrote comprehensive unit tests for key features like data fetching and error handling.


###Time Spent

Total Time Spent: 4 hours

###Trade-offs and Decisions

Image Caching:
I opted to implement a custom image caching mechanism using NSCache instead of relying on third-party libraries like SDWebImage. This allowed me to keep the app light with fewer dependencies and better control over cache management.

Data Fetching & Persistence:
I chose not to store recipe data on disk, as per the requirements. This decision keeps the app simple but also limits offline functionality. If the app were to include offline support, this could be revisited.

Error Handling:
I provided specific alert messages for different error scenarios (e.g., network failure, invalid data), ensuring clear communication with the user. However, more robust retry mechanisms could be added for a smoother experience in case of network errors.


###Weakest Part of the Project
The weakest part of the project is offline support. Since the app does not store recipes locally, users cannot access their recipe list without an internet connection. If offline functionality were required, I would implement a local database or persistent storage to store recipes when they are fetched.

###External Code and Dependencies
No external libraries or dependencies were used for this project. The app was built using native Swift components, such as SwiftUI, UIKit, and URLSession. The custom image caching logic was implemented using NSCache.

###Additional Information

Constraints:
The app was designed to be simple, focusing on displaying recipes from the API endpoint. It does not implement offline functionality, as the data is not stored locally.

Future Improvements:
Offline functionality: Adding offline support by persisting recipes and images locally.
Error recovery: Implementing automatic retries for network failures or adding a retry button in the UI.
Enhanced UI: Adding more sorting or filtering options for recipes, such as by cuisine or popularity.
