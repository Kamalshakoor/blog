require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "Category should be valid" do
    @category = Category.new(name:'Tech')
  end
  # test "the truth" do
  #   assert true
  # end
end
