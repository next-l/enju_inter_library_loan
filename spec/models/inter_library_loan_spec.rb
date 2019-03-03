# -*- encoding: utf-8 -*-
require 'rails_helper'

describe InterLibraryLoan do
  #pending "add some examples to (or delete) #{__FILE__}"

end

# == Schema Information
#
# Table name: inter_library_loans
#
#  id                   :bigint(8)        not null, primary key
#  item_id              :uuid             not null
#  borrowing_library_id :uuid             not null
#  requested_at         :datetime
#  shipped_at           :datetime
#  received_at          :datetime
#  return_shipped_at    :datetime
#  return_received_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
