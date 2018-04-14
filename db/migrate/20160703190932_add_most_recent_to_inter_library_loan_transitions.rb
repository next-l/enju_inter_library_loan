class AddMostRecentToInterLibraryLoanTransitions < ActiveRecord::Migration[5.1]
  def up
    add_column :inter_library_loan_transitions, :most_recent, :boolean, null: true
  end

  def down
    remove_column :inter_library_loan_transitions, :most_recent
  end
end
