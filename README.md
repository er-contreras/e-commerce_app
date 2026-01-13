# E-Commerce App

## Features implemented

- Implement the about user story
- Author Management
  - Unit testing
  - Functional Testing
  - Integration Testing
- Book Inventory Management
  - Implmenting the Publisher Administration Interface
  - Implementing the Book Administration Interface
- Book Catalog Browsing
  - Implementing the Book Catalog Interface
  - Creating an RSS Feed
- Shopping Cart Implementation
  - Implementing the user stories
  - Use Ajax request to add book to the cart
- Drag and Drop
  - Be able to add a book to the cart by dragging it
- Forum Implementation
  - I use Discourse open source to link Dream Library app to a forum.

## Built With

- Major languages: Ruby 3.1.3
- Frameworks: Rails 7.0.1
- Databases: PostgreSQL
- Tested: miniTest
- Search Engine: pg search
- Linters: Rubocop
- Hotwire(Turbo and Stimulus)
- Discourse

* Note: I use Discorse locally using a URL as localhost:3001 for the Library app and a localhost:4200 for Discourse. In order to make it work I run Redis and Discourse in my terminal.

## Live Demo

[Under Construction](https://livedemo.com)

## Date of current video 22/02/2023

## Full screen to better quality

https://user-images.githubusercontent.com/67211919/220817209-3dda8a35-62f0-4e1c-bf28-6e7c77106da4.mp4

## With Discourse implemented.

https://user-images.githubusercontent.com/67211919/222612463-38c9f971-6588-46a0-beb0-85511adfa3af.mov

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
   sudo docker compose run web rails db:create db:migrate
   sudo docker compose run web yarn add sass
   sudo docker compose up
   ```

## Run tests
in the console to run all tests Or Type ```ruby test/another/path``` to a specific test

```bash
sudo docker compose run --rm web rails test
```

## For forum usage. *Temporarily out of services
*In this case we are running our main app in port 3001 in order to let discourse use the port 3000

In your terminal:
## In a separate terminal instance run redis
```bash
redis-server
```
## In a separate terminal instance, navigate to your discourse folder (cd ~/discourse) and run:
```bash
bin/ember-cli
```

## In a separate terminal instance, navigate to your discourse folder (cd ~/discourse) and run:
```bash
rails server
```
## Author

👤 **Erick Contreras**

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
