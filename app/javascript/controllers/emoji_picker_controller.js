import { Controller } from "@hotwired/stimulus";
import { createPopup } from 'https://unpkg.com/@picmo/popup-picker@latest/dist/index.js?module';

export default class extends Controller {
  static targets = [ "button", "input" ]

  connect() {
    this.picker = createPopup({
      // picker options go here
    }, {
      referenceElement: this.buttonTarget,
      triggerElement: this.buttonTarget
    });
    this.picker.addEventListener('emoji:select', event => {
      this.inputTarget.value += event.emoji;
    });
  }

  toggle() {
    this.picker.toggle()
  }
}