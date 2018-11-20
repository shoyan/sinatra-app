require 'pstore'

class Memos
  def self.set_storage(storage)
    @@storage = storage
  end

  def self.all
    store = PStore.new(@@storage)
    store.transaction do
      store['memos'] || {}
    end
  end

  def self.find(id)
    store = PStore.new(@@storage)
    store.transaction do
      memos = store['memos'] || {}
      memos.select{|k,v| k == id}
    end
  end

  def self.add(memo)
    store = PStore.new(@@storage)
    store.transaction do
      memos = store['memos']
      memos = {} if memos.nil?
      memos[memo.id] = memo
      store['memos'] = memos
    end
  end

  def self.delete(id)
    store = PStore.new(@@storage)
    store.transaction do
      store['memos'].delete(id)
    end
  end
end
