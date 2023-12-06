import { Controller } from "@hotwired/stimulus"

/**
 * This controller handles sliding in alerts and dismissing them.
 */
export default class extends Controller {
  connect() {
    this.element.classList.add('transform', 'ease-out', 'duration-500', 'transition', 'translate-y-2', 'opacity-0', 'sm:translate-y-0', 'sm:translate-x-2')

    // Delay the addition of the classes for the final state of the entering transition
    setTimeout(() => {
      this.element.classList.remove('translate-y-2', 'opacity-0', 'sm:translate-y-0', 'sm:translate-x-2')
      this.element.classList.add('translate-y-0', 'opacity-100', 'sm:translate-x-0')
    }, 100)
  }

  dismiss() {
    this.element.classList.add('transition', 'ease-in', 'duration-100', 'opacity-0')
    setTimeout(() => {
      this.element.remove()
    }, 100)
  }
}
