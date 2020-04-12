# frozen_string_literal: true

module Lpte
  module Contexts
    class Regular < Contexts::Base
      private

      def visit_subjects
        data['subject_urls'].each { |url| visit url }
      end
    end
  end
end
