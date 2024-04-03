# Exer 6: State Management

## Student Information

Reinalyn A. Madrid

2020-05130

CMSC 23 - U3L

## Application Description
This is a simple shopping application that contains 3 screens namely: the product catalog page, the cart page, and a checkout page. The product catalog page displays a list of items which are shampoo, soap, and toothpaste. It also has buttons to add each item in the cart and to go to the cart page. The cart page displays the items that were added in the cart and the total cost. It also has buttons to go back to the product catalog page, to remove the item in the cart, to reset the items in the cart, and a checkout button. Once the user clicks the checkout button, it will go to the checkout page. This page displays the final list of items and the total cost to pay. Once the "Pay Now!" button is clicked, it will reset the shopping list, and will be redirected to the product catalog page with a prompt stating that the payment is successful.

## Things I did in the Code
To implement the checkout functionality, I first added a button for the checkout. Then, I created a new class to display the widgets for the checkout page. The getItems() function uses a conditional rendering wherein if the cart is empty, it will only display "No items to checkout". But if the cart is not empty, it will display the items in the shopping list with its name and price, and a button for "Pay Now" will appear. Once the Pay Now button is clicked, it uses `context.read<ShoppingCart>().removeAll()` to clear the shopping list and set the total to 0. Also, it will be redirected to the product catalog page with a prompt at the snackbar stating that the payment is successful. I also reused the computeCost() function from the Cart page to display the total cost using a consumer.

## Challenges
There was not much challenge/s in doing the exercise because the checkout feature was somewhat similar to the given sample codes. I think the challenging part at first, while studying the sample codes was understanding when to use context.watch() and context.read(). 
