import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["cards"]
  connect() {
  }

  search(event){
    console.log("test")
    fetch("/items?search%5Bquery%5D=" + event.currentTarget.value,
    {
      method: "GET",
      headers: {
        "Accept": "application/json"
      }
    }).
    then(response => {
      return response.json();
    }).then(data => {
      console.log(data)
      this.cardsTarget.innerHTML = data.cardsHtml;
    })
  }
}
