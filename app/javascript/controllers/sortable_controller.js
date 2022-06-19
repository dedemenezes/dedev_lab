// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from 'sortablejs';

export default class extends Controller {

  connect() {
    Sortable.create(this.element, {
      filter: ".ignore-elements",
      easing: "cubic-bezier(1, 0, 0, 1)"
    })

  }
}
