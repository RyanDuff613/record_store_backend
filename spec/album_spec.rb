require 'rspec'
require 'album'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("giatn steps", nil)
      album.save()
      album2 = Album.new("blue", nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('.all') do
    it ("returns an empty array when no albums have been saved") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save')do
    it("saves an album")do
      album = Album.new("giant steps", nil)
      album.save()
      album2 = Album.new("blue", nil)
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==')do 
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("blue",nil)
      album2 = Album.new("blue",nil)
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it ("clears all saved albums")do
      album = Album.new("giant steps", nil)
      album.save()
      album2 = Album.new("blue", nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('#update') do
    it("updates an album by id")do
      album = Album.new("giant steps", nil)
      album.save()
      album.update("love supreme")
      expect(album.name).to(eq("love supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("giant steps", nil)
      album.save()
      album2 = Album.new("blue", nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end
end