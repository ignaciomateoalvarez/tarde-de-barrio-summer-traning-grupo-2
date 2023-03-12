import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
	static values = {url:String};

  change(e){
    console.log(this.urlValue);
    const body = JSON.stringify({asists: {asist: e.target.name, value: e.target.value }})
    console.log(body)
    this.submit('PUT', body)
  }

  submit(method, body) {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    return fetch(this.urlValue, {
      method: method,
      headers: {
      "X-CSRF-Token": csrfToken, 
      "Content-Type": "application/json"
    },
    body: body
   } )
  }
}