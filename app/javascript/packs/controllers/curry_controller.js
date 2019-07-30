import { Controller } from "stimulus"

export default class extends Controller {
  initialize() {
  }

  connect() {
    console.log("Connected to curry controller")
  }

  updateField(event) {
    const targetId = event.target.dataset["curryTargetId"]
    const target = document.getElementById(targetId)

    let val = "hmmmm"
    target.value = val
  }
}
