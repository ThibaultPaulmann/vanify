import { Controller } from "@hotwired/stimulus";
import { initFlatPickr } from "../plugins/init_flatpickr";

// Connects to data-controller="booking-card"
export default class extends Controller {
  connect() {
    console.log("connected to booking card");
    initFlatPickr();
  }
}
