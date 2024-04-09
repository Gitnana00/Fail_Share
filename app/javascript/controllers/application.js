import "@hotwired/turbo-rails"
import "controllers"
import { Application } from '@hotwired/stimulus'
import { Autocomplete } from 'stimulus-autocomplete'

const application = Application.start()
application.register('autocomplete', Autocomplete)

application.debug = false
window.Stimulus   = application

export { application }
