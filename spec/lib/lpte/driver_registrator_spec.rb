describe Lpte::DriverRegistrator do
  describe '.call' do
    let(:expected_options) do
      [
        '--headless',
        '--no-sandbox',
        '--disable-gpu',
        '--disable-dev-shm-usage'
      ]
    end

    subject(:registrator) { described_class.call }

    it 'configures capybara' do
      expect { registrator }.to change { Capybara.default_max_wait_time }.to(5).
        and change { Capybara.run_server }.to(false).
        and change { Capybara.current_driver }.to(:chrome)
    end

    it 'returns capybara driver object' do
      expect(registrator).to be_instance_of(Capybara::Selenium::Driver)
    end

    it 'set driver options' do
      expect(registrator.options[:options].args.to_a).to eq(expected_options)
    end
  end
end
