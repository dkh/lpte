require 'capybara/dsl'

class Senario < SimpleDelegator
  include Capybara::DSL

  def run
    data['students'].each do |student|
      login(student)

      data['subject_urls'].each { |url| visit url }

      logout
    end
  end

  private

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
    @data ||= YAML.load_file('config/secrets.yml')
  end
end
