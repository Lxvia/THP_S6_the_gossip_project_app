class TagGossip < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tags, :gossips
  end
end
