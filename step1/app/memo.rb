require 'time'
require 'digest'

class Memo
  attr_accessor :id, :title, :body, :created_at, :updated_at

  def self.create(title, body, time = Time.now)
    new(title, body, time)
  end

  def initialize(title, body, time)
    @id = Digest::MD5.hexdigest(title + body + time.to_s)
    @title = title
    @body = body
    @created_at = time
    @updated_at = time
  end

  def update(params, time = Time.now)
    @title = params[:title]
    @body = params[:body]
    @updated_at = time
    self
  end
end
