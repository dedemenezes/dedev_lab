import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['list', 'popup']
  static values = {
    url: String
  }

  connect() {
  }

  display() {
    this.popupTarget.classList.remove('input--hide')
  }

  hide() {
    this.popupTarget.classList.add('input--hide')
  }

  update(event) {
    fetch(`${this.urlValue}?order_by=${event.currentTarget.innerText}`, {
      headers: {
        'Accept': 'text/plain'
      }
    })
    .then(response => response.text())
    .then(data => this.#insertUpdatedList(data))
    this.popupTarget.classList.add('input--hide')
  }

  #insertUpdatedList(data) {
    this.listTarget.innerHTML = data
  }
}
