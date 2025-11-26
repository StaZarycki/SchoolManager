import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.timeoutId = setTimeout(() => {
            this.close()
        }, 5000)
    }

    close() {
        if (this.timeoutId) {
            clearTimeout(this.timeoutId)
        }

        this.element.classList.add('opacity-0', 'transition-opacity', 'duration-300')

        this.element.addEventListener('transitionend', () => {
            this.element.remove()
        }, {once: true})
    }

    disconnect() {
        if (this.timeoutId) {
            clearTimeout(this.timeoutId)
        }
    }
}