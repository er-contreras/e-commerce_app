import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="droppable"
export default class extends Controller {
  drop(event) {
    // Add the item with the specified id to the cart
    const id = event.dataTransfer.getData("text/data")

    fetch("/add", {
      method: "POST",
      mode: 'cors',
      cache: 'default',
      credentials: "same-origin",
      headers: {
        Accept: "text/vnd.turbo-stream.html, text/html, application/xhtml+xml",
        "Content-Type": "application/json",
        "X-CSRF-Token": document.head.querySelector("[name='csrf-token']").content,
      },
      redirect: 'follow',
      referrerPolicy: "no-referrer-when-downgrade",
      body: JSON.stringify({
        id: +id
      }),
    }).then(() => {
      Turbo.visit("/catalog/index");
    });
  }

  dragOver(event) {
    console.log("Drag over method called")
    event.preventDefault()
  }
}
