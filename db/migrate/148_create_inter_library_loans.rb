class CreateInterLibraryLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :inter_library_loans do |t|
      t.references :item, foreign_key: true, null: false, type: :uuid
      t.references :borrowing_library, foreign_key: {to_table: :libraries}, null: false, type: :uuid
      t.timestamp :requested_at
      t.timestamp :shipped_at
      t.timestamp :received_at
      t.timestamp :return_shipped_at
      t.timestamp :return_received_at

      t.timestamps
    end
  end
end
