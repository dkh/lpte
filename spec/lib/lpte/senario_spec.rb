describe Lpte::Senario do
  describe '.call' do
    let(:driver) { double(:driver) }

    context 'context is nil' do
      it 'calls correct service' do
        expect_any_instance_of(Lpte::Contexts::Regular).to receive(:run).once

        described_class.call(driver, context: nil)
      end
    end

    context 'context is not in the list of allowed' do
      it 'calls correct service' do
        expect_any_instance_of(Lpte::Contexts::Regular).to receive(:run).once

        described_class.call(driver, context: 'random_context')
      end
    end

    context 'context is my_subjects' do
      it 'calls correct service' do
        expect_any_instance_of(Lpte::Contexts::MySubjects).to receive(:run).once

        described_class.call(driver, context: 'my_subjects')
      end
    end
  end
end
