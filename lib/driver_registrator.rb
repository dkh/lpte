require 'capybara'
require 'selenium-webdriver'

class DriverRegistrator
  class << self
    MAX_WAIT_TIME = 5

    def call
      Capybara.default_max_wait_time = MAX_WAIT_TIME
      Capybara.run_server = false
      Capybara.current_driver = :chrome

      Capybara.register_driver :chrome do |app|
        Capybara::Selenium::Driver.new(app, browser: :chrome, options: driver_options)
      end.call
    end

    private

    def driver_options
      Selenium::WebDriver::Chrome::Options.new.tap do |options|
        options.add_argument('--no-sandbox')
        options.add_argument('--disable-gpu')
        options.add_argument('--disable-dev-shm-usage')
        options.add_argument('--window-size=1400,1400')
      end
    end
  end
end
