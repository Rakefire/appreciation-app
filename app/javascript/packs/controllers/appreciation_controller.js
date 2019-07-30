import { Controller } from "stimulus"

export default class extends Controller {
  initialize() {
  }

  connect() {
  }

  next(event) {
    event.preventDefault()

    this.scrollToId(event.target.dataset["target"])
  }

  scrollToId(id) {
    const target = document.getElementById(id)

    target.scrollIntoView({
      behavior: 'smooth'
    });
  }
}
