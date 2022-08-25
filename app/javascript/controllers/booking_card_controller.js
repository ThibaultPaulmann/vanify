import { Controller } from "@hotwired/stimulus";
import { initFlatPickr } from "app/javascript/plugins/init_flatpickr.js";

// Connects to data-controller="booking-card"
export default class extends Controller {
  connect() {
    console.log("connected to booking card");
    initFlatPickr();
  }

  click() {
    console.log("clicked");
  }
}
