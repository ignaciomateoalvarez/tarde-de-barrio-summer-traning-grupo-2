import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
	static targets = ["modal"];
	connect() {
		document.getElementById("modal-background").style = "opacity: 0.25";
		document.getElementById("modal-background").style.pointerEvents = "none";
	}

	closeModal() {
		this.element.parentElement.removeAttribute("src");
		this.element.remove();
		document.getElementById("modal-background").style = "opacity: 1";
	}

	// hide modal on successful form submission
	// action: "turbo:submit-end->turbo-modal#submitEnd"
	submitEnd(e) {
		if (e.detail.success) {
			this.closeModal();
		}
	}

	// hide modal when clicking ESC
	// action: "keyup@window->turbo-modal#closeWithKeyboard"
	closeWithKeyboard(e) {
		if (e.code == "Escape") {
			this.closeModal();
		}
	}

	// hide modal when clicking outside of modal
	// action: "click@window->turbo-modal#closeBackground"
	closeBackground(e) {
		if (e && this.modalTarget.contains(e.target)) {
			return;
		}
		this.closeModal();
	}
}
