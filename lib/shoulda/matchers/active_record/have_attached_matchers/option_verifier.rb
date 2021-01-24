module Shoulda
  module Matchers
    module ActiveRecord
      # @private
      class OptionVerifier
        delegate :reflection, to: :reflector

        def initialize(reflector)
          @reflector = reflector
        end

        def correct_for?(*args)
          expected_value, name, type = args.reverse

          if expected_value.nil?
            true
          else
            expected_value == actual_value_for(name)
          end
        end

        private

        attr_reader :reflector

        def actual_value_for(name)
          reflection.options[name]
        end
      end
    end
  end
end
