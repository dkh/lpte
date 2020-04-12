# frozen_string_literal: true

module Lpte
  module Contexts
    class MySubjects < Contexts::Base
      private

      def visit_subjects
        subject_links.each { |link| visit link }
      end

      def subject_links
        @subject_links ||= find('.block_course_list').all('a').map { |a| a['href'] }
      end
    end
  end
end
