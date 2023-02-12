import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="droppable"
export default class extends Controller {
  drop(event) {
    console.log("I'm in drop")
    event.preventDefault()
    // const id = event.dataTransfer.getData("text/data")
    // Add the item with the specified id to the cart
  }

  dragOver(event) {
    console.log("Drag over method called")
    event.preventDefault()
  }

  // drop(event) {
  //   console.log("I'm in drop")
  //   event.stopPropagation();
  //
  //   event.target.classList.remove("over");
  //   this.resetOpacity();
  //
  //   // fetch("/add", {
  //   //   method: "POST",
  //   //   credentials: "same-origin",
  //   //   headers: {
  //   //     Accept: "text/vnd.turbo-stream.html",
  //   //     "Content-Type": "application/json",
  //   //     "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content,
  //   //   },
  //   //   body: JSON.stringify({
  //   //     source_id: this.dragSrcEl.dataset.id,
  //   //     target_id: event.target.dataset.id,
  //   //   }),
  //   // })
  //   //     .then((response) => response.text())
  //   //     .then(Turbo.renderStreamMessage);
  // }
}
