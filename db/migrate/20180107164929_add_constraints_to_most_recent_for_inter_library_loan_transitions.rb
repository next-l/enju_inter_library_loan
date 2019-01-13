class AddConstraintsToMostRecentForInterLibraryLoanTransitions < ActiveRecord::Migration[5.2]
  disable_ddl_transaction!

  def up
    add_index :inter_library_loan_transitions, [:inter_library_loan_id, :most_recent], unique: true, where: "most_recent", name: "index_inter_library_loan_transitions_parent_most_recent" #, algorithm: :concurrently
    change_column_null :inter_library_loan_transitions, :most_recent, false
  end

  def down
    remove_index :inter_library_loan_transitions, name: "index_inter_library_loan_transitions_parent_most_recent"
    change_column_null :inter_library_loan_transitions, :most_recent, true
  end
end
