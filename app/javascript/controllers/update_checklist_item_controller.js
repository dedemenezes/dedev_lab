import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ['amount', 'form', 'input', 'container']

  connect() {
  }

  markAsCompleted(event) {
    // console.log(event.currentTarget.checked)
    fetch(`/checklist_items/${event.currentTarget.dataset.itemId}`, {
      method: 'PATCH',
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken(),
        'Accept': "text/plain"
      },
      body: JSON.stringify({ "completed": event.currentTarget.checked })
    })
    .then(response => response.text())
    .then(data => this.#insertNewContent(data))
  }

  #insertNewContent(data) {
    this.element.innerHTML = ''
    this.element.innerHTML = data
  }
}
