require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
  	#NOTE: we want to test
  	# - response contains our:
  	#  + layout
  	#  + product information
  	#  + number formatting
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/

  end

end
