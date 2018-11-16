require 'time'
require 'digest'

class Memo
  attr_accessor :id, :title, :body, :created_at

  def self.create(title, body, time = Time.now)
    new(title, body, time)
  end

  def initialize(title, body, time)
    @id = Digest::MD5.hexdigest(title + body + time.to_s)
    @title = title
    @body = body
    @created_at = time
  end
end
