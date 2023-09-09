import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages"]
  connect() {
    console.log("Hello World!")
    this.messagesTarget.value= "edited"
  }

  edit(){

  }
}
