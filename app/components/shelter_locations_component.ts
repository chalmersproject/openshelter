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
      console.log(JSON.parse(JSON.stringify(shelters)))
      shelters.forEach(({location: { coordinates }, popupFrameId, popupFrameUrl}) => {
        console.log({popupFrameUrl})
        const popup = new mapboxgl.Popup({ closeOnClick: true })
            .setLngLat(coordinates as [number, number])
            .setHTML(`<div class="w-60 h-40 bg-white text-black text-sm p-2 rounded-md"><turbo-frame id="${popupFrameId}" src="${popupFrameUrl}"><p>Loading...</p></turbo-frame></div>`);

        const el = document.createElement('div');
        // el.className = 'mapboxgl-marker mapboxgl-marker-anchor-center';
        console.log("marker element")
        const svg = document.createElement('svg')
        const svc_circle = `
          <svg width='100' height='100'>
            <circle cx='50' cy='50' r='40' stroke='green' stroke-width='4' fill='yellow' />
          </svg>`;
        svg.innerHTML = svc_circle
        el.append(svg)
        console.log(el)
        new mapboxgl.Marker(el)
          .setLngLat(coordinates as [number, number])
          .setPopup(popup)
          .addTo(target);
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
