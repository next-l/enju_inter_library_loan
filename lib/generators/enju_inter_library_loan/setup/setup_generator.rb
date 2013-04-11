class EnjuInterLibraryLoan::SetupGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def setup
    inject_into_class 'app/models/item.rb', Item,
      "  enju_inter_library_loan_item_model\n"
end
