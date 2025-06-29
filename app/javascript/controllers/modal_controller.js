import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modalCloseBtn"]

    connect() {
        this.modalContainer = this.element
        this.handleEscape = this.closeModalViaEscape.bind(this);
    }

    disconnect() {
        this.closeAllModals();
        this.disableEscapeListener();
    }

    openModal(modal) {
        modal.setAttribute('open', true)
    }

    openModalViaButton(e) {
        const modalTargetId = e.currentTarget.dataset.modalTargetId;
        const targetModal = this.modalContainer.querySelector(`[data-modal-id="${modalTargetId}"]`);

        // Find if the target modal has a parent modal, if true keep the parent open.
        // * This occurs on the organisation membership cards where the disabled reasons modal is nested inside of the
        // organisation membership preview / show. If the parent is hidden it will also hide the nested modal so in the
        // cases where modals are nested it will keep both modals open.
        if (this.findParentModal(targetModal)) {
            if (targetModal.classList.contains('modal--no-close')) {
                this.disableEscapeListener();
            }
        } else {
            this.closeAllModals() // Close all modals before opening a new one
        }

        if (e.currentTarget.hasAttribute("disabled")) {
            e.preventDefault();
        } else {
            this.openModal(targetModal)
            if (!targetModal.classList.contains('modal--no-close')) {
                targetModal.addEventListener('click', (e) => this.closeModalViaOutsideClick(e));
                this.enableEscapeListener(); // Enable Escape key listener
            }
        }
    }

    reopenPreviouslyOpenModal() {
        const previouslyOpenModal = this.modalContainer.querySelector('.modal--previous')
        if(previouslyOpenModal) {
            previouslyOpenModal.classList.remove('modal--previous')
            this.openModal(previouslyOpenModal)
            this.enableEscapeListener();
        }
    }

    findParentModal(targetModal) {
        let parent = targetModal.parentElement;
        while (parent) {
            if (parent.classList.contains('modal') && parent !== targetModal) {
                return parent;
            }
            parent = parent.parentElement;
        }
        return null;
    }

    closeModal(modal) {
        modal.removeAttribute('open')
        this.reopenPreviouslyOpenModal() // Reopen the previously open modal if it exists

        // Disable Escape key listener if no modals are open
        if (this.modalContainer.querySelectorAll('.modal[open]').length === 0) {
            this.disableEscapeListener();
        }
    }

    closeModalViaButton(e) {
        const modalCloseBtn = e.currentTarget;
        const modal = modalCloseBtn.closest('.modal');
        this.closeModal(modal)
    }

    closeModalViaOutsideClick(e) {
        const modal = e.currentTarget;
        if(e.target === modal || Array.from(this.modalCloseBtnTargets).includes(modal)) {
            e.preventDefault();
            this.closeModal(modal)
        }
    }

    closeModalViaEscape(e) {
        // Close the top-most modal if the Escape key is pressed
        if (e.key === "Escape") {
            e.preventDefault();
            const openModals = this.modalContainer.querySelectorAll('.modal[open]');
            if (openModals.length > 0) {
                const topModal = openModals[openModals.length - 1];
                if (topModal && !topModal.classList.contains('modal--no-close')) {
                    this.closeModal(topModal);

                    // Re-enable the Escape key listener for the parent modal if it exists
                    const previouslyOpenModal = this.modalContainer.querySelector('.modal--previous')
                    if (previouslyOpenModal) {
                        this.enableEscapeListener();
                    }
                }
            }
        }
    }

    enableEscapeListener() {
        window.addEventListener('keydown', this.handleEscape);
    }

    disableEscapeListener() {
        window.removeEventListener('keydown', this.handleEscape);
    }

    closeAllModals() {
        const openModals = this.modalContainer.querySelectorAll('.modal[open]');

        if(openModals.length === 0) { return }

        if (openModals.length === 1) {
            openModals[0].removeAttribute('open')
            if(openModals[0].classList.contains('modal--previous')) {
                openModals[0].classList.remove('modal--previous')
            } else {
                openModals[0].classList.add('modal--previous')
            }
        } else {
            openModals.forEach(openModal => {
                this.closeModal(openModal)
            });
        }
    }
}
