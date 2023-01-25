import { parse as parseWKT } from "wellknown";
import { resolve } from "app/javascript/helpers";
import { context, register } from "app/javascript/alpine/helpers";
import first from "lodash/first";

import type { GeoJSONGeometry } from "wellknown";
import type { Point } from "geojson"
import { Map, MapboxEvent, LngLat } from "mapbox-gl";

type ShelterLocation = {
  readonly id: string;
  readonly location: Point;
}

type ShelterLocationsComponentParams = {
  readonly shelters: ShelterLocation[];
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
  readonly shelters: ShelterLocation[];
  readonly interactive: boolean;
};

const ShelterLocationsComponentMapData = ({
  shelters,
  interactive,
}: ShelterLocationsComponentMapParams) => {
  // const geometry: GeoJSONGeometry | null = value ? parseWKT(value) : null;
  // const points = resolve<LngLat[]>(() => {
  //   switch (geometry?.type) {
  //     case "Point": {
  //       const [lng, lat] = geometry.coordinates;
  //       const point = new mapboxgl.LngLat(lng, lat);
  //       return [point];
  //     }
  //     case "MultiPoint": {
  //       const positions = geometry.coordinates;
  //       const points = positions.map(
  //         ([lng, lat]) => new mapboxgl.LngLat(lng, lat),
  //       );
  //       return points;
  //     }
  //     default:
  //       return [];
  //   }
  // });

  return {
    // == State ==
    map: null as Map | null,

    // == Helpers ==
    handleLoad({ target }: MapboxEvent) {
      context(this).$dispatch("shelter-locations-component-map:load");
      console.log(JSON.parse(JSON.stringify(shelters)))
      shelters.forEach(({location: { coordinates }}) => {
        new mapboxgl.Marker()
          .setLngLat(coordinates as [number, number])
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
