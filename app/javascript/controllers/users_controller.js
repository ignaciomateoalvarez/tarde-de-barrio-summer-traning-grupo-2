import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ["checkbox", "display"];

	connect() {}

	toggleActive() {
		this.element.parentElement.submit();
	}
}
