import { Controller } from "@hotwired/stimulus";
import { useTransition } from "stimulus-use"

export default class extends Controller {
  static targets = ["container"];

  connect() {
    useTransition(this, { element: this.contentTarget });
  }

  toggleModal(event) {
    event.preventDefault();

    this.element.classList.toggle("overflow-hidden")
    this.containerTarget.classList.toggle("hidden");
    this.toggleTransition();
  }
}
