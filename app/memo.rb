require 'time'

class Memo
  attr_accessor :title, :body, :created_at

  def self.create(title, body, time = Time.now)
    obj = new
    obj.title = title
    obj.body  = body
    obj.created_at = time
    obj
  end
end
