import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="droppable"
export default class extends Controller {
  drop(event) {
    console.log("I'm in drop, ID:", event.dataTransfer.getData("text/data"))
    event.stopPropagation();

    // Add the item with the specified id to the cart
    const id = event.dataTransfer.getData("text/data")

    fetch("/add", {
      method: "POST",
      credentials: "same-origin",
      headers: {
        // Accept: "text/vnd.turbo-stream.html",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content,
      },
      body: JSON.stringify({
        // source_id: this.dragSrcEl.dataset.id,
        // target_id: event.target.dataset.id,
        id: +id
      }),
    })
        .then((response) => response.text())
        // .then((data) => console.log(data))
        .then(Turbo.renderStreamMessage);
  }

  dragOver(event) {
    console.log("Drag over method called")
    event.preventDefault()
  }
}
