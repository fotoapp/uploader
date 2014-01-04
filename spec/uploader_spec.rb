require 'spec_helper'

describe Uploader do

  describe '::VERSION' do

    it 'returns a string' do
      expect(Uploader::VERSION).to be_a(String)
    end
  end
end
