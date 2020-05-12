require 'rspec'
require 'album'

describe '#Album' do
  describe('.all') do
    it ("returns an empty array when no albums have been saved") do
      expect(Album.all).to(eq([]))
    end
  end
end