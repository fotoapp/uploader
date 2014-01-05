require 'spec_helper'

describe Uploader::Photo do
  before do
    @photo = described_class
      .new(fixture_path(File.join('images', 'doge.jpg')))
  end

  describe '#identifier' do

    it 'is a string' do
      expect(@photo.identifier).to be_a(String)
    end

    it 'is 40 characters' do
      expect(@photo.identifier.length).to eq(40)
    end

    it 'is valid hex' do
      expect(@photo.identifier =~ /\h+/).to be_true
    end

    it 'is the correct sha1 sum of the image' do
      expect(@photo.identifier)
        .to eq('cbd6de22348a805f78f86093b33b71a26879f860')
    end
  end

  describe '#new' do

    context 'nonexistant file' do

      it 'raises an error' do
        expect do
          described_class.new(fixture_path(File.join('images', 'invalid.jpg')))
        end.to raise_error
      end
    end

    context 'directory' do

      it 'raises an error' do
        expect do
          described_class.new(fixture_path('images'))
        end.to raise_error
      end
    end

    context 'non image file' do

      it 'raises an error' do
        expect do
          described_class
            .new(fixture_path(File.join('images', 'notanimage.txt.jpg')))
        end.to raise_error
      end
    end
  end
end
