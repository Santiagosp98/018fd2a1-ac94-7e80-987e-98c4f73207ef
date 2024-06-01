# Docker Setup

## Prerequisites

Ensure you have the following installed on your system:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Santiagosp98/018fd2a1-ac94-7e80-987e-98c4f73207ef.git cart-api
    cd cart-api
    ```
   <br>

2. **Create an `.env` file**:
   - Copy the `.env.example.erb` file to create your `.env` file:
    ```bash
    cp .env.example.erb .env
    ```
   - Fill in the necessary environment variables in the `.env` file as per the provided `.env.example.erb`.
   <br><br>

3. **Build and run the Docker containers**:
    ```bash
    docker-compose up --build
    ```
   <br>

4. **Accessing the application**:
   - The application should now be running on `http://localhost:3000`

## API Endpoints

### Create Cart

**Endpoint:** `POST http://localhost:3000/carts`

**Description:** This endpoint is used to create a new cart.

**Request:**
- No request body is needed.

**Response:**
- The response contains a `cart_id` in UUID v4 format.

**Response example:**
```json
{
  "cart_id": "568c5819-c7df-4be9-8aae-184134e5a9e9"
}
```
**Notes**
- The cart_id returned by this endpoint is essential for performing operations with other endpoints in the API.

<br>

### Add Item to Cart

**Endpoint:** `POST http://localhost:3000/carts/{cart_id}/items`

**Description:** This endpoint is used to add an item to the previously created cart.

**Request:**
- The request body must include the `item_id` and `quantity`.

**Request Example:**
```json
{
  "item_id": 3,
  "quantity": 1
}
```

**Response:**
- The response confirms the item has been added to the cart.

**Response Example:**
```json
{
  "message": "Item added."
}
```

**Notes:**
- Replace `{cart_id}` in the endpoint URL with the actual `cart_id` obtained from the create cart response.
- Ensure the `item_id` and `quantity` are provided in the request body.
<br>

### Remove Item from Cart

**Endpoint:** `DELETE http://localhost:3000/carts/{cart_id}/items`

**Description:** This endpoint is used to decrease the quantity of an item in the cart. When the quantity of the item in the cart reaches zero or below zero, it will remove the item completely.

**Request:**
- The request body must include the `item_id` and `quantity`.

**Request Example:**
```json
{
  "item_id": 31,
  "quantity": 1
}
```

**Response:**
- The response confirms the item has been removed from the cart.

**Response Example:**
```json
{
  "message": "Item removed."
}
```

**Notes:**
- Replace `{cart_id}` in the endpoint URL with the actual `cart_id` obtained from the create cart response.
- Ensure the `item_id` and `quantity` are provided in the request body.




<br>

### Generate Order

**Endpoint:** `POST http://localhost:3000/orders`

**Description:** This endpoint is used to generate an order from the given cart.

**Request:**
- The request body must include the `cart_id`.

**Request Example:**
```json
{
  "cart_id": "568c5819-c7df-4be9-8aae-184134e5a9e9"
}
```

**Response:**
- The response contains details of the generated order including the order `id`, `date`, `amount`, and the list of `items`.

**Response Example:**
```json
{
  "id": 12,
  "date": "2024-06-01T06:39:36.973Z",
  "amount": "413.77",
  "items": [
    {
      "id": 1,
      "name": "Small Wooden Knife",
      "quantity": 5,
      "price": "65.91",
      "subtotal": "329.55"
    },
    {
      "id": 2,
      "name": "Aerodynamic Rubber Clock",
      "quantity": 3,
      "price": "3.02",
      "subtotal": "9.06"
    },
    {
      "id": 3,
      "name": "Heavy Duty Leather Car",
      "quantity": 1,
      "price": "75.16",
      "subtotal": "75.16"
    }
  ]
}
```

**Notes:**
- Ensure the `cart_id` is provided in the request body.


## Things to Improve

1. **Add Support for Currencies:**
   - Enhance the application to handle multiple currencies. This includes updating the database schema, modifying existing endpoints, and ensuring all calculations are currency-aware.
   <br><br>
2. **Implement Auditing with the Stock Transactions Table:**
   - Utilize the already created `stock_transactions` table to implement auditing. This involves tracking changes in stock levels and recording all relevant details such as timestamps, user actions, and quantities.
   <br><br>
   
3. **Implement Unit Tests for Services:**
   - Develop comprehensive unit tests for the services layer of the application. This will help ensure that all business logic is correctly implemented and functions as expected.
