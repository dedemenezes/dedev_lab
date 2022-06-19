import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['list', 'popup']

  connect() {
    console.log(this.popupTarget)
  }

  display(event) {
    console.log(this.element)
    this.popupTarget.classList.remove('input--hide')
  }

  hide() {
    this.popupTarget.classList.add('input--hide')
  }
}
