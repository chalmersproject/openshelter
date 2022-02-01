module.exports = {
  service: {
    name: "api",
    endpoint: {
      url: "http://localhost:8080/api/graphql",
    },
  },
  client: {
    includes: [
      `${__dirname}/app/components/**/*.{ts,tsx}`,
      `${__dirname}/app/routes/**/*.{ts,tsx}`,
    ],
  },
};
