import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["unhide"];

  password(e) {
    const input = this.unhideTarget;
    if (input.type === "password") {
      e.target.classList.remove("fa-eye-slash");
      e.target.classList.add("fa-eye");
      input.type = "text";
    } else {
      e.target.classList.remove("fa-eye");
      e.target.classList.add("fa-eye-slash");
      input.type = "password";
    }
  }
}
