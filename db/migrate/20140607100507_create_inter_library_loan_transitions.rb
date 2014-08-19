class CreateInterLibraryLoanTransitions < ActiveRecord::Migration
  def change
    create_table :inter_library_loan_transitions do |t|
      t.string :to_state
      t.text :metadata, default: "{}"
      t.integer :sort_key
      t.integer :inter_library_loan_id
      t.timestamps
    end

    add_index :inter_library_loan_transitions, :inter_library_loan_id
    add_index :inter_library_loan_transitions, [:sort_key, :inter_library_loan_id], unique: true, name: "index_inter_library_loan_transitions_on_sort_key_and_loan_id"
  end
end
