import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-with-ajax"
export default class extends Controller {
  greet() {
    const element = document.querySelector('#shopping_cart');
      element.style.backgroundColor = 'red';
    // console.log('Hi there!!', this.element);
  }
}
