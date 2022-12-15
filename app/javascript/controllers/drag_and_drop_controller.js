import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drag-and-drop"
export default class extends Controller {
  static targets = ["book"]

  dragStart(event) {
    event.target.style.opacity = "0.1";
    this.dragSrcEl = event.target;

    event.dataTransfer.effectAllowed = "move";
    event.dataTransfer.setData("text/html", event.target.innerHTML);
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

  drop(event) {
    event.stopPropagation();

    event.target.classList.remove("over");
    this.resetOpacity();

    fetch("/add", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        Accept: "text/vnd.turbo-stream.html",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content,
      },
      body: JSON.stringify({
        source_id: this.dragSrcEl.dataset.id,
        target_id: event.target.dataset.id,
      }),
    })
        .then((response) => response.text())
        .then(Turbo.renderStreamMessage);
  }

  dragEnd() {
    this.resetOpacity();
  }

  resetOpacity() {
    this.bookTargets.forEach((el) => {
      el.style.opacity = '1'
    })
  }
}
