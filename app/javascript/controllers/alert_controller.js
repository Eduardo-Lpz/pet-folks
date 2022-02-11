import { Controller } from "@hotwired/stimulus";
import { useTransition } from "stimulus-use";

export default class extends Controller {
  static targets = ["notification"];

  connect() {
    if (this.hasNotificationTarget) {
      useTransition(this, { element: this.notificationTarget })
      this.toggleTransition();
    }

    setTimeout(this.dismiss.bind(this), 5000);
  }

  dismiss() {
    if (this.hasNotificationTarget) {
      if (this.notificationTarget.classList.contains("opacity-100")) {
        this.toggleTransition();
      }
    }

    setTimeout(function() {
      this.element.remove() 
    }.bind(this), 200);
  }
}
