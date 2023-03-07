import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static targets = ['files', 'fileName'];

  show(){
    this.fileNameTarget.innerHTML='';
    var files = this.filesTarget.files
    for (let i = 0; i < files.length; i++) {
      var p = document.createElement("p");
      p.textContent = files[i].name;
      p.classList.add('file-name');
      this.fileNameTarget.appendChild(p);
    }
  }
}