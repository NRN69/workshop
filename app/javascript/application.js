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

import Button from 'bootstrap/js/dist/button';
import Collapse from 'bootstrap/js/dist/collapse';
import Alert from 'bootstrap/js/dist/alert';
import Carousel from 'bootstrap/js/dist/carousel';
import Modal from 'bootstrap/js/dist/modal';
import Popover from 'bootstrap/js/dist/popover';
import ScrollSpy from 'bootstrap/js/dist/scrollspy';
import Tab from 'bootstrap/js/dist/tab';
import Tooltip from 'bootstrap/js/dist/tooltip';
import Toast from 'bootstrap/js/dist/toast';


export {
    Alert,
    Button,
    Carousel,
    Collapse,
    Modal,
    Popover,
    ScrollSpy,
    Tab,
    Toast,
    Tooltip,
};


ActiveStorage.start()
bootstrap.start()
