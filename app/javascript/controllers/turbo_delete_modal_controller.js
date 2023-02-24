import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
	static targets = ["delete-modal"];
	connect() {
		document.getElementById("modal-background").style.pointerEvents = "none";
	}

	closeModal() {
		this.element.parentElement.removeAttribute("src");
		this.element.remove();
		document.getElementById("modal-background").style.pointerEvents = "all";
	}

	submitEnd(e) {
		if (e.detail.success) {
			this.closeModal();
		}
	}
}