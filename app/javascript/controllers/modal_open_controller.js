import { Controller } from "@hotwired/stimulus";
import { useDispatch } from "stimulus-use";

export default class extends Controller {
  static targets = [];

  connect() {
    useDispatch(this)
  }

  open(event) {
    event.preventDefault();
    this.dispatch("toggle");
  }
}
