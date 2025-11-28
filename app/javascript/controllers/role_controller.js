import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Role controller connected")
        this.toggleClass()
    }

    toggleClass(event) {
        const roleSelect = event ? event.target : this.element.querySelector('select[name*="[role]"]')
        const selectedRole = roleSelect.value
        const classField = document.getElementById('school-class-field')
        const taughtClassesField = document.getElementById('taught-classes-field')

        if (selectedRole === 'student') {
            if (classField) classField.style.display = 'block'
            if (taughtClassesField) taughtClassesField.style.display = 'none'
        } else if (selectedRole === 'teacher') {
            if (classField) classField.style.display = 'none'
            if (taughtClassesField) taughtClassesField.style.display = 'block'
        } else {
            if (classField) classField.style.display = 'none'
            if (taughtClassesField) taughtClassesField.style.display = 'none'
        }
    }
}