describe Lpte::Contexts::Regular, :vcr do
  describe '.run' do
    let(:driver) { Lpte::DriverRegistrator.call }
    let(:data) do
      {
        'login_url' => ENV['LOGIN_URL'],
        'students' => [
          {
            'login' => ENV['STUDENT_1_LOGIN'],
            'password' => ENV['STUDENT_1_PASSWORD']
          }
        ],
        'subject_urls' => [
          ENV['SUBJECT_URL_1'],
          ENV['SUBJECT_URL_2']
        ]
      }
    end

    before do
      allow_any_instance_of(described_class).to receive(:data) { data }

      context.call
    end

    subject(:context) { -> { described_class.new(driver).run } }

    it 'visits pages' do
    end
  end
end
