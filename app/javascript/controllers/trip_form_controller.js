import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
  }

  next(event) {
    this.active = this.inputTargets.filter(target => target.classList.contains('show_input'))[0]
    this.active.classList.remove('show_input')
    this.active.classList.add('hide_input')
    this.active.nextElementSibling.classList.remove('hide_input')
    this.active.nextElementSibling.classList.add('show_input')
  }
}
