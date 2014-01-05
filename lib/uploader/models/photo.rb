# A photo to be uploaded to the cloud
class Uploader::Photo
  def initialize(path)
    path = Pathname.new(path)
    fail unless path.exist? && path.file?
    @path = path
  end

  def identifier
    @identifier ||= Digest::SHA1.hexdigest IO.read(@path)
  end
end
