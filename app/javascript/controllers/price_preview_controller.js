import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "plateInput", "sauceInput", "preview" ]
  static values = {
    plateCents: Number,
    sauceCents: Number,
  }

  connect() {
    this.updatePrice();
  }

  updatePrice() {
    const platePriceInCents = parseInt(this.plateInputTarget.value) * this.plateCentsValue;
    const saucePriceInCents = parseInt(this.sauceInputTarget.value) * this.sauceCentsValue;

    const totalInCents = platePriceInCents + saucePriceInCents;
    const total = (totalInCents / 100).toFixed(2);

    this.previewTarget.textContent = `$${total}`;
  }

}
