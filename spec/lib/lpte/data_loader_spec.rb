describe Lpte::DataLoader do
  describe '.call' do
    let(:path_to_file) { 'tmp/test_data_loading.yml' }

    let(:content) do
      "students:\n  - login: login1\n    password: password1\n  - login: login2\n    password: password2\n\nlogin_url: login_url\nsubject_urls:\n  - subject_url_1\n  - subject_url_2\n"
    end

    let(:expected_output) do
      {
        'students' => [
          {
            'login' => 'login1',
            'password' => 'password1'
          },
          {
            'login' => 'login2',
            'password' => 'password2'
          }
        ],
        'login_url' => 'login_url',
        'subject_urls' => [
          'subject_url_1',
          'subject_url_2'
        ]
      }
    end

    before { File.open(path_to_file, 'w+') { |file| file.write(content) } }

    after { File.delete(path_to_file) if File.exist?(path_to_file) }

    subject { described_class.call(path_to_file) }

    it { is_expected.to eq expected_output }
  end
end
