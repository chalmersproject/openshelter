# typed: strict
# frozen_string_literal: true

Trestle.resource(:users) do
  menu { item :users, icon: "fa fa-user" }

  table do
    column :id, link: true
    column :email
    column :created_at
    column :updated_at
    actions
  end

  form { email_field :email }
end
