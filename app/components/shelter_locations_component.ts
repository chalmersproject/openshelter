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
  readonly userAgent?:string
};

const ShelterLocationsComponentData = ({
  shelters,
  interactive,
  userAgent,
}: ShelterLocationsComponentParams) => ({
  // == State ==
  shelters,
  interactive: !!interactive,
  userAgent: userAgent
});

register("ShelterLocationsComponent", ShelterLocationsComponentData);

type ShelterLocationsComponentMapParams = {
  readonly shelters: Shelter[];
  readonly interactive: boolean;
  readonly userAgent:string | undefined;
};

const ShelterLocationsComponentMapData = ({
  shelters,
  interactive,
  userAgent,
}: ShelterLocationsComponentMapParams) => {

  return {
    // == State ==
    map: null as Map | null,

    // == Helpers ==
    handleLoad({ target }: MapboxEvent) {
      context(this).$dispatch("shelter-locations-component-map:load");
      this.map?.getContainer().addEventListener('click',(x)=>{
        if (userAgent == "mobile"){
          const targetElement = x.target
          if (!targetElement.classList.contains("mapboxgl-canvas"))
            return;
          const val = document.getElementsByClassName("mapboxgl-ctrl-geocoder--input");
          const element : HTMLElement = val[0] as HTMLElement;
          element.style.display = "initial";
        }
      })

      shelters.forEach(({location: { coordinates }, popupFrameId, popupFrameUrl, markerFrameId, markerFrameUrl}) => {
        const shelter_marker_markup = document.createElement('div')
        const svg_circle = `
          <turbo-frame id="${markerFrameId}" src="${markerFrameUrl}">
          </turbo-frame>
          `;
        shelter_marker_markup.innerHTML = svg_circle;

        const shelter_marker =  new mapboxgl.Marker(shelter_marker_markup)
          .setLngLat(coordinates as [number, number])
          .addTo(target);

          // add listener for each time marker is clicked
          //
          // each time a marker is clicked a new popup is generated and assigned to the marker.
          // this is a workaround to ensure the data in the popup is refreshed every time it is opened
          //
          shelter_marker.getElement().addEventListener('click', () => {

            if (userAgent == "mobile"){
              const val = document.getElementsByClassName("mapboxgl-ctrl-geocoder--input");
              const element : HTMLElement = val[0] as HTMLElement;
              element.style.display = "none";
              const newCoords = coordinates as [number,number];

              this.map?.flyTo({
                center:[newCoords[0]+.006,newCoords[1]]
              });
            }

            console.log("Shelter marker: " + markerFrameId + " was clicked!");

            const popup = new mapboxgl.Popup({className: "shelter_measurement_popup", closeOnClick: true, closeButton: false })
            .setLngLat(coordinates as [number, number])
            .setHTML(`
                <turbo-frame id="${popupFrameId}" src="${popupFrameUrl}">
                  <p>Loading...</p>
                </turbo-frame>
              `);
            shelter_marker.setPopup(popup);
          });
      });
    },

    // == Lifecycle ==
    init() {
      this.map = new mapboxgl.Map({
        container: context(this).$root,
        style: "mapbox://styles/mapbox/dark-v10",
        center: [-79.402593, 43.661732],
        zoom: 12.5,
        cooperativeGestures: false,
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
