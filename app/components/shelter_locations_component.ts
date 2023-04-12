import { parse as parseWKT } from "wellknown";
import { resolve } from "app/javascript/helpers";
import { context, register } from "app/javascript/alpine/helpers";
import first from "lodash/first";

import type { GeoJSONGeometry } from "wellknown";
import type { Point } from "geojson"
import { Map, MapboxEvent, LngLat } from "mapbox-gl";

type Shelter = {
  readonly id: string;
  readonly location: Point;
  readonly popupFrameId: string;
  readonly popupFrameUrl: string;
  readonly markerFrameId: string;
  readonly markerFrameUrl: string;
}

type ShelterLocationsComponentParams = {
  readonly shelters: Shelter[];
  readonly interactive?: boolean;
};

const ShelterLocationsComponentData = ({
  shelters,
  interactive,
}: ShelterLocationsComponentParams) => ({
  // == State ==
  shelters,
  interactive: !!interactive,
});

register("ShelterLocationsComponent", ShelterLocationsComponentData);

type ShelterLocationsComponentMapParams = {
  readonly shelters: Shelter[];
  readonly interactive: boolean;
};

const ShelterLocationsComponentMapData = ({
  shelters,
  interactive,
}: ShelterLocationsComponentMapParams) => {

  return {
    // == State ==
    map: null as Map | null,

    // == Helpers ==
    handleLoad({ target }: MapboxEvent) {
      context(this).$dispatch("shelter-locations-component-map:load");
      shelters.forEach(({location: { coordinates }, popupFrameId, popupFrameUrl, markerFrameId, markerFrameUrl}) => {
        const popup = new mapboxgl.Popup({ closeOnClick: true, closeButton: false })
            .setLngLat(coordinates as [number, number])
            .setHTML(`
                <turbo-frame id="${popupFrameId}" src="${popupFrameUrl}">
                  <p>Loading...</p>
                </turbo-frame>
              `);

        const shelter_marker = document.createElement('div')
        const svg_circle = `
          <turbo-frame id="${markerFrameId}" src="${markerFrameUrl}">
          </turbo-frame>
          `;
        shelter_marker.innerHTML = svg_circle

        new mapboxgl.Marker(shelter_marker)
          .setLngLat(coordinates as [number, number])
          .setPopup(popup)
          .addTo(target)
          .togglePopup();
      });
    },

    // == Lifecycle ==
    init() {
      this.map = new mapboxgl.Map({
        container: context(this).$root,
        style: "mapbox://styles/mapbox/dark-v10",
        center: [-79.402593, 43.661732],
        zoom: 12.5,
        cooperativeGestures: true,
        interactive,
      });
      if (interactive) {
        this.map.addControl(
          new MapboxGeocoder({
            mapboxgl,
            accessToken: mapboxgl.accessToken,
            marker: false,
          }),
        );
      }
      this.map.once("load", this.handleLoad.bind(this));
    },
    destroy() {
      if (this.map) {
        this.map.remove();
        this.map = null;
      }
    },
  };
};

register("ShelterLocationsComponentMap", ShelterLocationsComponentMapData);
