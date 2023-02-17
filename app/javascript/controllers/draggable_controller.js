import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="draggable"
export default class extends Controller {
  static targets = ["book"]

  dragStart(event) {
    event.target.style.opacity = "0.5";
    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setData("text/data", event.target.dataset.id)
  }

  dragEnter(event) {
    event.target.classList.add("over");

    if (event.preventDefault) {
      event.preventDefault();
    }
    return false;
  }

  dragOver(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    return false;
  }

  dragLeave(event) {
    event.target.classList.remove("over");
    this.resetOpacity();
  }


  dragEnd(event) {
    event.target.classList.remove("over");
    this.resetOpacity();
  }

  resetOpacity() {
    this.bookTargets.forEach((el) => {
      el.style.opacity = '1'
    })
  }
}
