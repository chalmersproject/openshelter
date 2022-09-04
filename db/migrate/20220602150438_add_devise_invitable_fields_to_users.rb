# typed: true
# frozen_string_literal: true

class AddDeviseInvitableFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invitation_token, :string
    add_column :users, :invitation_created_at, :datetime
    add_column :users, :invitation_sent_at, :datetime
    add_column :users, :invitation_accepted_at, :datetime
    add_column :users, :invitation_limit, :integer
    add_column :users, :invited_by_id, :uuid
    add_index :users, :invitation_token, unique: true
    add_foreign_key :users, :users, column: :invited_by_id
  end
end
