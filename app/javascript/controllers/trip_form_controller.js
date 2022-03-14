import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["title", "synopsis", "original_title" ]

  connect() {
  }

  next(event) {
    if (this.titleTarget.classList.contains("show_input")) {
      this.titleTarget.classList.remove('show_input')
      this.titleTarget.classList.add('hide_input')
      this.synopsisTarget.classList.remove('hide_input')
      this.synopsisTarget.classList.add('show_input')
    } else if (this.synopsisTarget.classList.contains("show_input")) {
      this.synopsisTarget.classList.remove('show_input')
      this.synopsisTarget.classList.add('hide_input')
      this.original_titleTarget.classList.remove('hide_input')
      this.original_titleTarget.classList.add('show_input')
    }
  }
}
