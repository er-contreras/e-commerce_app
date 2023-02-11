import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="draggable"
export default class extends Controller {
  static targets = ["book"]

  dragStart(event) {
    console.log("In drag start", this.element)
    console.log("In drag start", event.target)
    event.target.style.opacity = "0.5";
    this.dragSrcEl = event.target;

    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setData("text/html", event.target.innerHTML);
  }

  dragEnter(event) {
    console.log("In the drag enter", event.target)
    event.target.classList.add("over");

    if (event.preventDefault) {
      event.preventDefault();
    }
    return false;
  }

  dragOver(event) {
    console.log("In drag over")
    if (event.preventDefault) {
      event.preventDefault();
    }
    return false;
  }

  dragLeave(event) {
    console.log("In drag leave")
    event.target.classList.remove("over");
    this.resetOpacity();
  }


  dragEnd() {
    console.log("I'm drag end")
    this.resetOpacity();
  }

  resetOpacity() {
    this.bookTargets.forEach((el) => {
      el.style.opacity = '1'
    })
  }
}
