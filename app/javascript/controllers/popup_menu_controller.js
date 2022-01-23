import { Controller } from "@hotwired/stimulus";
import { useClickOutside, useTransition } from "stimulus-use";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    useClickOutside(this);
    useTransition(this, { element: this.menuTarget })
  }

  clickOutside() {
    if (!this.menuTarget.classList.contains("hidden")) {
      this.toggleTransition();
    }
  }
}
