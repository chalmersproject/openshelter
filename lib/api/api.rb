# typed: ignore
# frozen_string_literal: true

class API < ApplicationAPI
  format :json

  docs "Show server metadata", tag: "/"
  get "/" do
    payload = { version: app.version }
    present(payload)
  end

  namespace :account do
    mount(AccountAPI)
  end

  add_swagger_documentation(
    {
      mount_path: "/spec",
      desc: "Swagger-compatible API documentation.",
      doc_version: app.version,
      add_root: true,
      info: {
        title: "Chalmers API",
        description:
          "The RESTful API that powers [chalmersproject.com](https://chalmersproject.com).",
      },
      tags: [
        { name: "/", description: "Systems metadata" },
        { name: "account", description: "Account operations" },
      ],
    },
  )
end
