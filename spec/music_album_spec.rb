require_relative '../classes/music_album'

describe 'Music Album Class' do
  before :each do
    @album = MusicAlbum.new(2000, false, true)
    @album2 = MusicAlbum.new(2000, false, false)
  end

  it 'should validate music album publish date' do
    expect(@album.publish_date).to eq 2000
  end

  it 'should validate music album on spotify' do
    expect(@album.on_spotify).to eq true
  end

  it 'should validate an object is instance of MusicAlbum' do
    expect(@album).to be_an_instance_of(MusicAlbum)
  end

  it 'should validate can_be_archived? method' do
    expect(@album.can_be_archived?).to eq true
    expect(@album2.can_be_archived?).to eq false
  end
end
