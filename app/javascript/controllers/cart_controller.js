import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  closeButton(event) {
    const cartCloseButton = document.querySelector("#shopping_cart");
    cartCloseButton.style.display = "none";

    event.preventDefault();
  }

  openCart(event) {
    const iconCart = document.querySelector("#shopping_cart");
    iconCart.style.display = "block";

    event.preventDefault();
  }
}
