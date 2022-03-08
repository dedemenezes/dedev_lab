import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['input', 'url', 'list']

  static values = {
    url: String
  }

  send(event) {
    event.preventDefault()
    this.requestURL = `${this.urlTarget.action}?query=${this.inputTarget.value}&commit=Search`
    
    fetch(this.requestURL, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        // console.log(data)
        this.listTarget.outerHTML = data;
      })
  }
}
