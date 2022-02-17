ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # def assert_difference(object, method, difference = 1)
  #   initial_value = object.send(method)
  #   yield
  #   assert_equal initial_value + difference, object.send(method)
  # end

  # def assert_no_difference(object, method, &block)
  #   assert_difference object, method, 0, &block
  # end
end
