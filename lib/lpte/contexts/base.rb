# frozen_string_literal: true

module Lpte
  module Contexts
    class Base < SimpleDelegator
      include Capybara::DSL

      def run
        data['students'].each do |student|
          next unless student['login']

          login(student)

          visit_subjects

          logout
        end
      end

      private

      def visit_subjects
        raise NotImplementedError
      end

      def login(student)
        visit data['login_url']

        fill_in 'Username', with: student['login']
        fill_in 'Password', with: student['password']

        click_on 'Log in'
      end

      def logout
        find('.textmenu').click

        within('ul.menu') do
          logout_link = find('a[data-title="logout,moodle"]')[:href]

          visit logout_link
        end
      end

      def data
        @data ||= DataLoader.call('config/secrets.yml')
      end
    end
  end
end
