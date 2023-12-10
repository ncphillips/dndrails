import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  enteringClasses = ["transition", "ease-out", "duration-100"]
  leavingClasses = ["transition", "ease-in", "duration-75"]
  visibleClasses = ["transform", "opacity-100", "scale-100"]
  hiddenClasses = ["transform", "opacity-0", "scale-95"]

  connect() {
    window.addEventListener("click", this.hideOnOutsideClick)
  }

  toggle(event) {
    event.preventDefault();
    event.stopPropagation();
    if (this.isVisible) {
      this.hide()
    } else {
      this.show()
    }
  }

  show = () => {
    this.menuTarget.classList.add(...this.enteringClasses)
    this.menuTarget.classList.remove(...this.hiddenClasses)
    this.menuTarget.classList.add(...this.visibleClasses)
    this.menuTarget.classList.remove(...this.enteringClasses)

    window.addEventListener("click", this.hideOnOutsideClick, {once: true})
  }

  hide = ()=> {
    this.menuTarget.classList.add(...this.leavingClasses)
    this.menuTarget.classList.remove(...this.visibleClasses)
    this.menuTarget.classList.add(...this.hiddenClasses)
    this.menuTarget.classList.remove(...this.leavingClasses)
  }

  get isVisible() {
    return this.menuTarget.classList.contains("opacity-100")
  }

  hideOnOutsideClick = (event) => {
    if (!this.menuTarget.contains(event.target) && this.isVisible) {
      this.hide()
    }
  }
}