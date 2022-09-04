import Cable from "@rails/actioncable";

window.Cable = Cable;

const consumer = Cable.createConsumer();

export default consumer;
