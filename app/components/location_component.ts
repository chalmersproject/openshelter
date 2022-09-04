import { parse as parseWKT } from "wellknown";
import { resolve } from "app/javascript/helpers";
import { context, register } from "app/javascript/alpine/helpers";
import first from "lodash/first";

import type { GeoJSONGeometry } from "wellknown";
import { Map, MapboxEvent, LngLat } from "mapbox-gl";

type LocationComponentParams = {
  readonly value?: string;
  readonly interactive?: boolean;
};

const LocationComponentData = ({
  value,
  interactive,
}: LocationComponentParams) => ({
  // == State ==
  value: value,
  interactive: !!interactive,
});

register("LocationComponent", LocationComponentData);

type LocationComponentMapParams = {
  readonly value?: string;
  readonly interactive: boolean;
};

const LocationComponentMapData = ({
  value,
  interactive,
}: LocationComponentMapParams) => {
  const geometry: GeoJSONGeometry | null = value ? parseWKT(value) : null;
  const points = resolve<LngLat[]>(() => {
    switch (geometry?.type) {
      case "Point": {
        const [lng, lat] = geometry.coordinates;
        const point = new mapboxgl.LngLat(lng, lat);
        return [point];
      }
      case "MultiPoint": {
        const positions = geometry.coordinates;
        const points = positions.map(
          ([lng, lat]) => new mapboxgl.LngLat(lng, lat),
        );
        return points;
      }
      default:
        return [];
    }
  });

  return {
    // == State ==
    map: null as Map | null,

    // == Helpers ==
    handleLoad({ target }: MapboxEvent) {
      context(this).$dispatch("location-component-map:load");
      if (points) {
        points.forEach(lngLat => {
          new mapboxgl.Marker().setLngLat(lngLat).addTo(target);
        });
      }
    },

    // == Lifecycle ==
    init() {
      this.map = new mapboxgl.Map({
        container: context(this).$root,
        style: "mapbox://styles/mapbox/dark-v10",
        center: first(points) || [-79.402593, 43.661732],
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

register("LocationComponentMap", LocationComponentMapData);
