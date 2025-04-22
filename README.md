# CardView - SwiftUI Component

## Description

CardView is a simple, reusable SwiftUI component designed to display a subtitle above an image. The image has a fixed size, and the component includes styles such as a corner radius and shadow for a modern, clean look. It uses `AsyncImage` to load images from URLs, providing fallback views when the image is loading or if there's an error.

## Features

- **Subtitle above the image**: Customizable subtitle text that is displayed above the image.
- **Fixed-size image**: The image has a set width and height, ensuring consistency in layout.
- **AsyncImage handling**: Uses `AsyncImage` to load remote images with built-in error handling and a loading state.
- **Custom Styling**: Includes a purple background, rounded corners, and shadow for a polished look.
- **Simple and reusable**: The component can be easily reused and customized in any SwiftUI project.

## Screenshot

![CardView Example](https://thumbs.dreamstime.com/b/delicate-delight-exploring-exquisite-textures-hues-purple-dessert-stunning-soft-focus-photography-indulge-your-373506048.jpg)

## Installation

To use `CardView` in your SwiftUI project, follow these steps:

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/CardView.git
    ```

2. **Add the code to your project**:
    Copy the `CardView.swift` file into your SwiftUI project.

3. **Use `CardView`**:
    You can now use the `CardView` component by adding it to your views:
    ```swift
    CardView(subtitle: "Your Text Here")
    ```

