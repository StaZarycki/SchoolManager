import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Role controller connected")
        // Show/hide on initial load
        this.toggleClass()
    }

    toggleClass(event) {
        const roleSelect = event ? event.target : this.element.querySelector('select[name*="[role]"]')
        const selectedRole = roleSelect.value
        const classField = document.getElementById('school-class-field')

        if (selectedRole === 'student') {
            classField.style.display = 'block'
        } else {
            classField.style.display = 'none'
        }
    }
}