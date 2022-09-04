import invariant from "tiny-invariant";
import { resolve } from "app/javascript/helpers";
import { context, register } from "app/javascript/alpine/helpers";

import type { Map, Marker, MapboxEvent, MapMouseEvent } from "mapbox-gl";

type LocationInputComponentParams = {
  readonly value: string;
};

const LocationInputComponentData = ({
  value,
}: LocationInputComponentParams) => ({
  // == State ==
  value,
});

register("LocationInputComponent", LocationInputComponentData);

type LocationInputComponentMapParams = {
  readonly value?: string;
};

const LocationInputComponentMapData = ({
  value,
}: LocationInputComponentMapParams) => {
  const lngLat = resolve(() => {
    if (value) {
      const wkt = resolve(() => {
        const matches = /^POINT \((.*)\)$/.exec(value);
        invariant(
          matches && matches[1],
          "failed to parse WKT (expected a valid POINT)",
        );
        return matches[1];
      });
      const [lng, lat] = wkt.split(" ").map(parseFloat);
      return new mapboxgl.LngLat(lng, lat);
    }
  });

  return {
    // == State ==
    map: null as Map | null,
    marker: null as Marker | null,

    // == Helpers ==
    handleKey(event: KeyboardEvent) {
      if (this.map) {
        const container = this.map.getCanvasContainer();
        container.style.cursor =
          event.ctrlKey || event.metaKey ? "grab" : "crosshair";
      }
    },
    handleLoad({ target }: MapboxEvent) {
      context(this).$dispatch("location-input-component-map:load");
      target.getCanvasContainer().style.cursor = "crosshair";
      if (lngLat) {
        invariant(!this.marker, "marker initialized before map load");
        this.marker = new mapboxgl.Marker().setLngLat(lngLat).addTo(target);
      }
    },
    handleClick({ target, lngLat }: MapMouseEvent) {
      if (target.loaded()) {
        context(this).$dispatch("location-input-component-map:click", {
          wkt: `POINT (${lngLat.toArray().join(" ")})`,
          lngLat,
        });
        this.marker?.remove();
        this.marker = new mapboxgl.Marker().setLngLat(lngLat).addTo(target);
      }
    },

    // == Lifecycle ==
    init() {
      this.map = new mapboxgl.Map({
        container: context(this).$root,
        style: "mapbox://styles/mapbox/streets-v11",
        center: lngLat || [-79.402593, 43.671732],
        zoom: 6,
        cooperativeGestures: true,
      })
        .addControl(
          new MapboxGeocoder({
            mapboxgl,
            accessToken: mapboxgl.accessToken,
            marker: false,
          }),
        )
        .once("load", this.handleLoad.bind(this))
        .on("click", this.handleClick.bind(this));
    },
    destroy() {
      if (this.map) {
        this.map.remove();
        this.map = null;
        this.marker = null;
      }
    },
  };
};

register("LocationInputComponentMap", LocationInputComponentMapData);
