module Shoulda
  module Matchers
    module ActiveRecord
      module HaveAttachedMatchers
        # @private
        class ModelReflector
          def initialize(subject, name)
            @subject = subject
            @name = name
          end

          def reflection
            @_reflection ||= reflect_on_association(name)
          end

          def reflect_on_association(name)
            reflection = model_class.reflect_on_association(name)

            if reflection

            end
          end

          def model_class
            subject.class
          end

          protected

          attr_reader :subject, :name
        end
      end
    end
  end
end
