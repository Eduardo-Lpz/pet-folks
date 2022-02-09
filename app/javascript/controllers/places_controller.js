import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "field", "map", "latLng" ]

  connect() {
    google.maps.event.addDomListener(window, 'load', this.initializeMap());
  }


  initializeMap() {
    this.map()
    this.marker()
    this.autocomplete()
  }

  map() {
    if (this._map == undefined) {
      this._map = new google.maps.Map(this.mapTarget, {
        streetViewControl: false,
        fullscreenControl: false,
        mapTypeControl: false,
        // disableDefaultUI: true,
        center: new google.maps.LatLng(
          // Just for center in TJ
          32.49674,
          -117.0178461
        ),
        zoom: 11
      })
    }
    return this._map
  }


  marker() {
    if (this._marker == undefined) {
      this._marker = new google.maps.Marker({
        map: this.map(),
        anchorPoint: new google.maps.Point(0,0)
      })
      this._marker.setPosition(this._map.getCenter())
      this._marker.setVisible(true)
    }
    return this._marker
  }

  autocomplete() {
    if (this._autocomplete == undefined) {
    this._autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
    this._autocomplete.bindTo('bounds', this.map())
    this._autocomplete.setFields(['address_components', 'geometry', 'icon', 'name'])

    this._autocomplete.addListener('place_changed', this.locationChanged.bind(this))
    }
    return this._autocomplete
  }

  locationChanged() {
    let place = this.autocomplete().getPlace();

    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return
    }

    this.map().fitBounds(place.geometry.viewport)
    this.map().setCenter(place.geometry.location)
    this.marker().setPosition(place.geometry.location)

    this.latLngTarget.value = `${this.marker().getPosition().lng()},${this.marker().getPosition().lat()}`
  }

  preventSubmit(event) {
    if (event.key == "Enter") {
      event.preventDefault()
    }
  }
}
