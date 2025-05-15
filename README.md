# Retro Realm - E-commerce UI Project
Student Name & ID: Karl Ryan Espiritu - 2023-2110581

# Project Description
Retro Realm is an e-commerce store that specializes in vintage and retro-themed products, including toys, antiques, and memorabilia. The store aims to provide a nostalgic shopping experience for enthusiasts and collectors who appreciate classic items from the past. The overall theme of the app reflects a retro aesthetic, combining vibrant colors and classic design elements to create an inviting atmosphere for users.

# Implemented Features
Screens Built

# Home Screen
Purpose: The main landing page where users can browse through various products.
Key UI Elements: A grid layout displaying product cards, each showing an image, name, and price. A bottom navigation bar allows users to switch between the home and cart screens.

# Product Detail Screen
Purpose: Provides detailed information about a selected product.
Key UI Elements: Large product image, product name, price, description, availability status, and options for selecting quantity, size, and color. An "Add to Cart" button is prominently displayed.
Shopping Cart Screen

# Purpose: Displays items that the user has added to their cart.
Key UI Elements: A list of cart items with product names, prices, quantities, and a subtotal. Options to update quantities or remove items are available, along with a button to proceed to checkout.
Checkout Screen

# Purpose: Allows users to enter shipping information and select a payment method.
Key UI Elements: A form for shipping details, a list of payment options, and an order summary showing the items in the cart and the subtotal.

# Additional UI Features
Implemented smooth transitions and animations between screens to enhance user experience.
Created custom widgets for product options (size and color selectors) to provide a more interactive experience.
Added form validation for the checkout process to ensure accurate user input.
Unique Design Choices & Creativity
To make Retro Realm unique, I focused on a vintage theme that resonates with the niche of retro products. The design incorporates a color palette of warm, earthy tones combined with vibrant accents to evoke nostalgia. The typography features classic fonts that reflect the retro aesthetic, while the iconography includes vintage-style icons to enhance the overall theme.

Innovative UI/UX features include a custom product options selector that allows users to easily choose sizes and colors, making the shopping experience more engaging. Additionally, I implemented a smooth animation for adding items to the cart, providing instant feedback to users.
# Challenges Faced & Solutions
Challenge 1: State Management
One significant challenge was managing the state of the shopping cart effectively, especially when adding or removing items. Initially, I struggled with ensuring that the cart updated correctly across different screens.

Solution: I implemented a local state management approach using Dart's built-in features. By maintaining a list of cart items in the Home Screen and passing it to the Shopping Cart Screen, I ensured that any updates were reflected in real-time.

Challenge 2: Form Validation
Another challenge was implementing form validation for the checkout process. I needed to ensure that users provided accurate shipping information before placing an order.

Solution: I utilized Flutter's form validation features, including the Form and TextFormField widgets, to create a user-friendly experience. I added validation logic to check for empty fields and provided clear error messages, guiding users to correct any mistakes before proceeding.

Overall, this project allowed me to enhance my skills in Flutter development while creating a unique and engaging e-commerce experience.

You can view the video of the run through here: https://drive.google.com/file/d/1QIKJl9N1ni1EN3COZOD1nUkuUBB_O1BU/view?usp=sharing
