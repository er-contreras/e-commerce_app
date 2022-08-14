// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from '@rails/ujs'

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    // console.log(event.path[2].attributes[1].value)
    let id = event.item.dataset.id
    // let id = event.path[2].attributes[1].value
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    console.log(event)

    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: 'PATCH',
      data: data
    })
  }
}
