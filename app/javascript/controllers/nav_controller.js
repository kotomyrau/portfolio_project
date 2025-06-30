import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["nav", "link"];

    toggle(e) {
        this.navTarget.classList.toggle("nav--active");

        this.linkTargets.forEach((link, index) => {
            console.log(link)
            if (link.style.animation) {
                link.style.animation = "";
            } else {
                link.style.animation = `navToggle 0.5s ease forwards ${index / 7 + 0.5}s`;
            }
        });

        this.navTarget.classList.toggle("nav--toggled");
    }
}
