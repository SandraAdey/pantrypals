import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { options: Object }

  connect() {
    console.log("hi from Tom!")
    new TomSelect(this.element, {
      ...this.optionsValue,
      tags: true,
      persist: false,
      createOnBlur: true,
      create: true
    });
  }
}
