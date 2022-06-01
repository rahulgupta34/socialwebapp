import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  debugger
  connect() {
    console.log("hello");
  }
  
  change(){
      console.log("submit end ");
  }
}
