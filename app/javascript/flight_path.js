const showMap = (takeoff, landing) => {
  // TODO: Construct the URL (with apiKey & takeoff) and make the fetch request to the mapbox API
  const key = "pk.eyJ1IjoiYXlhZGF2MTYiLCJhIjoiY2xsMHMzNDBhMDFqMDNlczBzc2M2bHM3eSJ9.s3jbbWp_UGQtgxdIKF910w";
  const takeoffUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${takeoff}.json?access_token=${key}`;
  const landingUrl = `https://api.mapbox.com/geocoding/v5/mapbox.places/${landing}.json?access_token=${key}`;
  fetch(takeoffUrl)
    .then(response => response.json())
    .then((data) => {
      console.log(data.features[0].center);
      // TODO: Insert the info into the DOM
      const coordinates = data.features[0].center
      // - Extract the coordinates from the parsed JSON response (takeoffLang, lat)
      const takeoffLang = coordinates[0];
      const takeoffLat = coordinates[1];
      // - Display the coordinates in the element where the coordinates will be displayed
      // - Create a map using the Mapbox API and the coordinates
      // - Add a marker to the map at the coordinates
      // eslint-disable-next-line no-undef
      mapboxgl.accessToken = key;
      // eslint-disable-next-line no-undef
      const map = new mapboxgl.Map({
        container: "map",
        style: "mapbox://styles/mapbox/streets-v9",
        // projection: 'globe',
        center: [takeoffLang, takeoffLat],
        zoom: 0
      });

      const marker = new mapboxgl.Marker()
        .setLngLat([ takeoffLang, takeoffLat ])
        .addTo(map);

        fetch(landingUrl)
    .then(response => response.json())
    .then((data) => {
      console.log(data.features[0].center);
      // TODO: Insert the info into the DOM
      const coordinates = data.features[0].center
      // - Extract the coordinates from the parsed JSON response (lang, lat)
      const landingLang = coordinates[0];
      const landingLat = coordinates[1];

      mapboxgl.accessToken = key;

      const marker2 = new mapboxgl.Marker()
        .setLngLat([ landingLang, landingLat ])
        .addTo(map);

      const bounds = [[takeoffLang, takeoffLat], [landingLang, landingLat]];
      const path_center = [(takeoffLang+landingLang)/2,(takeoffLat+landingLat)/2]
      map.fitBounds(bounds, { padding: 70, maxZoom: 2, duration: 4000 });
      map.setZoom(1.2);

      console.log(path_center);
      const target = path_center;
      map.flyTo({
        ...target, // Fly to the selected target
        duration: 12000, // Animate over 12 seconds
        essential: true // This animation is considered essential with
        //respect to prefers-reduced-motion
        });

      });
    });




};
//
// TODO: Select the form element
// TODO: Add event listener to the form that:
// - Prevents the default form submission behavior
// - Get the user input
// - Calls the showMap function with the user input as an argument
// const toggle_map = document.querySelector('head ');
// console.log(toggle_map);

window.addEventListener('DOMContentLoaded', (_event) => {
  console.log("loaded");
  // _event.preventDefault();
  const takeoff = document.querySelector('.path').dataset.takeoff;
  const landing = document.querySelector('.path').dataset.landing;
  showMap(takeoff, landing);
});
