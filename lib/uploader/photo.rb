# A photo to be uploaded to the cloud
class Uploader::Photo
  def initialize(path)
    @path = Pathname.new(path)
    fail unless @path.exist? && @path.file? && image?
  end

  def identifier
    @identifier ||= Digest::SHA1.hexdigest IO.read(@path)
  end

  private

  def image?
    jpg = Regexp.new("\xff\xd8\xff\xe0\x00\x10JFIF".force_encoding('binary'))
    jpg2 = Regexp.new("\xff\xd8\xff\xe1(.*){2}Exif".force_encoding('binary'))
    magic_bytes = IO.read(@path, 10)
    magic_bytes =~ /^#{jpg}|#{jpg2}/
  end
end
