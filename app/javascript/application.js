// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as ActiveStorage from "@rails/activestorage"
import * as bootstrap from "bootstrap"


export default class extends Controller {
    connect() {
        this.modal = new bootstrap.Modal(this.element)
    }

    open() {
        if (!this.modal.isOpened) {
            this.modal.show()
        }
    }

    close(event) {
        if (event.detail.success) {
            this.modal.hide()
        }
    }
}


ActiveStorage.start();
bootstrap.start();
