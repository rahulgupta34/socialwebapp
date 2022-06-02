import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {
    console.log("hello");
  }

  submitEnd(e){
    console.log(e);
  }

}
