import { createConsumer } from "@rails/actioncable";

const cable = createConsumer("/api/cable");
export default cable;
