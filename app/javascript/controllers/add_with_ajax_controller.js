import { Controller } from "@hotwired/stimulus"
import {getMetaValue} from "@rails/activestorage/src/helpers";

// Connects to data-controller="add-with-ajax"
export default class extends Controller {
  static value = { id: String }

  load({ params: { url } }) {
    fetch(url, {
      body: 2,
      method: 'POST',
      dataType: 'script',
      credentials: 'include',
      headers: {
        'X-CSRF-Token': getMetaValue('csrf-token')
      },
    })
        .then(response => response.json())
        .then(data => {
          console.log(data);
        })
        .catch(error => {
          console.error('Error:', error);
        });
  }
}
