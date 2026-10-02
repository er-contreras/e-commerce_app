# E-Commerce App
This repo holds a E-Commerce app that creates books and save it in a cart, you can drag and drop any book into the cart section
so you can be able to buy them.

## 🔴 Live Demo
> [!IMPORTANT] We are using Render free tier at the moment; please wait 50s until its fully loaded. \
> 
🚀 [E-Commerce App](https://e-commerce-app-1-croc.onrender.com/catalog/index/)

## Features implemented
- [x] Implement the about user story
- [x] Author Management
  - [x] Unit testing
  - [x] Functional Testing
  - [x] Integration Testing
- [x] Book Inventory Management
  - [x] Implmenting the Publisher Administration Interface
  - [x] Implementing the Book Administration Interface
- [x] Book Catalog Browsing
  - [x] Implementing the Book Catalog Interface
  - [x] Creating an RSS Feed
- [x] Shopping Cart Implementation
  - [x] Implementing the user stories
  - [x] Use Ajax request to add book to the cart
- [x] Drag and Drop
  - [x] Be able to add a book to the cart by dragging it

## Built With
- Major languages: Ruby 3.3.12
- Frameworks: Rails 7.1.0
- Databases: PostgreSQL
- Tested: miniTest
- Search Engine: pg search
- Linters: Rubocop
- Hotwire(Turbo and Stimulus)

## Getting Started

### Prerequisites
* Docker and Docker Compose
* Node.js & Yarn (for Discourse local development)

### 🛠 Installation & Setup

1. **Clone the repository**
   ```bash
   git clone git@github.com:er-contreras/e-commerce_app.git
   cd e-commerce_app
   ```
2. **Build & up with Docker**
   ```bash
   sudo docker compose build
   sudo docker compose run web rails db:create db:migrate db:seed
   sudo docker compose run web yarn add sass
   sudo docker compose up -d
   ```

### Run tests
in the console to run all tests Or Type ```ruby test/another/path``` to a specific test

```bash
sudo docker compose run --rm web rails test
```

## Author

👤 **Christian E. Contreras**

- GitHub: [@er-contreras](https://github.com/er-contreras)
- Linkedin: [LinkedIn](https://www.linkedin.com/in/er-contreras/)
- Twitter: [@er_contreras_](https://twitter.com/er_contreras_)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./LICENCE.md) licensed.
