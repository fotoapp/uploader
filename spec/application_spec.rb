require 'spec_helper'

describe Uploader::Application do

  describe '.run' do

    it 'does not raise an exception' do
      expect { described_class.run }.to_not raise_error
    end
  end
end
