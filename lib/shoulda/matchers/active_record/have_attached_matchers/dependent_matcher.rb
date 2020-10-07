module Shoulda
  module Matchers
    module ActiveRecord
      module HaveAttachedMatchers
        class DependentMatcher
          def initialize(dependent, name)
            @dependent = dependent
            @name = name
          end

          def description
            "dependent => #{dependent}"
          end

          def matches?(subject)
          end
        end
      end
    end
  end
end
