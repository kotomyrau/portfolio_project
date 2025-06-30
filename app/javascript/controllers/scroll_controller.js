import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["section"]

    connect() {
        console.log("ScrollController connected")
    }
    scrollToSection() {
        if (this.hasSectionTarget) {
            this.sectionTarget.scrollIntoView({ behavior: "smooth" })
        }
    }
}