import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-with-ajax"
export default class extends Controller {
  static values = { url: String }

    load() {
      console.log('Hi there', this.element)
  }
}
