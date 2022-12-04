import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-with-ajax"
export default class extends Controller {
  static values = {
    url: String
  }

  request() {
    const element = document.querySelector('#shopping_cart');
     element.style.backgroundColor = 'red';
      console.log('Hi there!!', this.element);

      // async function postData(url = '', data = {}) {
      //   const response = await fetch(url, {
      //     method: 'POST',
      //     mode: 'no-cors',
      //     cache: 'no-cache',
      //     credentials: 'same-origin',
      //     headers: {
      //       'Content-Type': 'application/json'
      //     },
      //     redirect: 'follow',
      //     referrerPolicy: 'no-referrer',
      //     body: JSON.stringify(data)
      //   });
      //   return response.json();
      // }
      //
      // postData(this.urlValue, { answer:  })
      //     .then((data) => {
      //       console.log(data);
      //     });

    // const data = { book: 'add/' };
    //
    // fetch('https://example.com/profile', {
    //   method: 'POST', // or 'PUT'
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    //   body: JSON.stringify(data),
    // })
    //     .then((response) => response.json())
    //     .then((data) => {
    //       console.log('Success:', data);
    //     })
    //     .catch((error) => {
    //       console.error('Error:', error);
    //     });

  }
}
