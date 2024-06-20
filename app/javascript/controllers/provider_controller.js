import { Controller } from "@hotwired/stimulus";
import { get } from "@rails/request.js";

export default class extends Controller {
  static targets = ["activitySelect"];
  change(event) {
    let provider = event.target.selectedOptions[0].value;
    let target = this.activitySelectTarget.id;

    get(`/vouchers/activities?target=${target}&provider=${provider}`, {
      responseKind: "turbo-stream",
    });
  }
}
