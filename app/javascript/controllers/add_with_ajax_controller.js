import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-with-ajax"
export default class extends Controller {
  load({ params: { url } }) {
    fetch(url)
        .then(response => response.text())
        .then(data => this.element.innerHTML = data)
  }
}
