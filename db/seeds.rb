# rubocop:disable Layout/LineLength
# typed: true
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.

# The data can then be loaded with the bin/rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Shelter.create!(
  [
    {
      name: "Dixon Hall Lakeshore 24 Hour Respite",
      address: "351 Lakeshore Blvd East, Toronto",
      contact_email: "delon.francis@dixonhall.org",
      contact_phone: "416-864-4490",
      max_headcount: "100",
      max_bedcount: "100",
      tags: [],
      website_url: "https://dixonhall.org",
    },
    {
      name: "Dixon Hall George St 24 Hour Respite",
      address: "354 George St, Toronto",
      contact_email: "354George.Intake@dixonhall.org",
      contact_phone: "647-888-1014",
      max_headcount: "50",
      max_bedcount: "50",
      tags: [],
      website_url: "https://dixonhall.org",
    },
    {
      name: "Park Road 24 Hour Respite",
      address: "21 Park Rd, Toronto",
      contact_email: "info@margarets.ca",
      contact_phone: "416-525-7070",
      max_headcount: "50",
      max_bedcount: "50",
      tags: [],
      website_url: "https://www.margarets.ca",
    },
    {
      name: "Progress Avenue 24 Hour Respite",
      address: "705 Progress Ave, Toronto",
      contact_email: "warden@wardenwoods.com",
      contact_phone: "416-639-6766",
      max_headcount: "49",
      max_bedcount: "49",
      tags: [],
      website_url: "https://wardenwoods.com/en/respite-services/",
    },
    {
      name: "St Felix Fraser 24 Hour Respite",
      address: "69 Fraser Ave, Toronto.",
      contact_email: "info@stfelixcentre.org",
      contact_phone: "(416) 534-4554",
      max_headcount: "100",
      max_bedcount: "100",
      tags: [],
      website_url: "https://stfelixcentre.org",
    },
    {
      name: "St Felix Augusta 24 Hour Respite",
      address: "25 Augusta Avenue, Toronto",
      contact_email: "volunteer@stfelixcentre.org",
      contact_phone: "(416) 203-1624",
      max_headcount: "50",
      max_bedcount: "50",
      tags: [],
      website_url: "https://stfelixcentre.org",
    },
    {
      name: "Fred Victor Strachan 24 Hour Respite",
      address: "1A Strachan Ave, Toronto",
      contact_email: "info@stfelixcentre.org",
      contact_phone: "4163384766",
      max_headcount: "100",
      max_bedcount: "100",
      tags: [],
      website_url: "https://fredvictor.org",
    },
  ]
)
