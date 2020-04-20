describe Lpte::Contexts::MySubjects, :vcr do
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
        ]
      }
    end

    let(:subject_urls) { [ENV['SUBJECT_URL_1'], ENV['SUBJECT_URL_2']] }
    let(:interactions) { VCR.current_cassette.http_interactions.instance_variable_get('@used_interactions') }

    before do
      allow_any_instance_of(described_class).to receive(:data) { data }
      allow_any_instance_of(described_class).to receive(:subject_links) { subject_urls }

      context.call
    end

    subject(:context) { -> { described_class.new(driver).run } }

    it 'visits pages' do
      expect(request_by_link(ENV['SUBJECT_URL_1'])).to be_instance_of(VCR::HTTPInteraction)
      expect(request_by_link(ENV['SUBJECT_URL_2'])).to be_instance_of(VCR::HTTPInteraction)
    end

    def request_by_link(link)
      interactions.detect { |interaction| interaction.request.body.include?(link) }
    end
  end
end
