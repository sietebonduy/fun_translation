RSpec.describe FunTranslation do
  specify '.client' do
    expect(described_class.client).to be_an_instance_of(described_class::Client)
  end

  specify 'version' do
    expect(described_class::VERSION).to be_an_instance_of(String)
  end
end