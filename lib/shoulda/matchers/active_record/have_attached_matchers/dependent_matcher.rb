module Shoulda
  module Matchers
    module ActiveRecord
      module HaveAttachedMatchers
        # @private
        class DependentMatcher
          def initialize(dependent, name)
            @dependent = dependent
            @name = name
          end

          def description
            "dependent => #{dependent}"
          end

          def matches?(subject)
            self.subject = ModelReflector.new(subject, name)

            if option_matches?
              true
            else
              self.missing_option = generate_missing_option

              false
            end
          end

          protected

          attr_accessor :subject, :dependent, :name

          private

          def option_verifier
            @_option_verifier ||= OptionVerifier.new(subject)
          end

          def option_matches?
            option_verifier.correct_for?(:string, :dependent, dependent)
          end

          def generate_missing_option
            [
              "#{name} should have",
              (dependent == true ? 'a' : dependent),
              'dependency',
            ].join(' ')
          end
        end
      end
    end
  end
end
