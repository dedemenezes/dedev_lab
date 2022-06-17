// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['realInput']

  connect() {
  }

  // arr.find(callback(element, index, array), thisArg)
  updateInput(event) {
    const userInput = event.currentTarget
    this.input = this.realInputTargets.find(target => target.value == userInput.value)
    this.input.checked = userInput.checked
  }
}
