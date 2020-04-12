# frozen_string_literal: true

module Lpte
  class DriverRegistrator
    class << self
      MAX_WAIT_TIME = 5
      DRIVER = :chrome

      def call
        configure_capybara!

        Capybara.register_driver DRIVER do |app|
          Capybara::Selenium::Driver.new(app, browser: DRIVER, options: driver_options)
        end.call
      end

      private

      private_constant :MAX_WAIT_TIME, :DRIVER

      def configure_capybara!
        Capybara.default_max_wait_time = MAX_WAIT_TIME
        Capybara.run_server = false
        Capybara.current_driver = DRIVER
      end

      def driver_options
        Selenium::WebDriver::Chrome::Options.new.tap do |options|
          options.add_argument('--headless')
          options.add_argument('--no-sandbox')
          options.add_argument('--disable-gpu')
          options.add_argument('--disable-dev-shm-usage')
        end
      end
    end
  end
end
