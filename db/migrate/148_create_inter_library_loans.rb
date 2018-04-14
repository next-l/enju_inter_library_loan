class CreateInterLibraryLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :inter_library_loans do |t|
      t.references :item, type: :uuid, null: false
      t.references :borrowing_library, foreign_key: {to_table: :libraries}, type: :uuid, null: false
      t.timestamp :requested_at
      t.timestamp :shipped_at
      t.timestamp :received_at
      t.timestamp :return_shipped_at
      t.timestamp :return_received_at
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
