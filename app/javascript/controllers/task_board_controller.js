import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['section']
  connect() {
    console.log(this.sectionTargets)
  }

  changeSection(event) {
    this.previousActive = this.sectionTargets.find( target => target.classList.contains('active'))
    event.currentTarget.classList.add('active')
    this.previousActive.classList.remove('active')
  }
}
