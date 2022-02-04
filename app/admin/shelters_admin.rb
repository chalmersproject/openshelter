# typed: strict
# frozen_string_literal: true

Trestle.resource(:shelters, register_model: true) do
  menu { item :shelters, icon: "fa fa-house-user" }

  form do
    text_field :name
    text_field :address
    email_field :email
    phone_field :phone
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |shelter|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end
end
