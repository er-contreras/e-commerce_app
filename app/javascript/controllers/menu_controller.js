import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  openMenu(event) {
    const menu = document.querySelector("#menu");
    menu.style.display = "block";

    event.preventDefault();
  }
}
