require 'pstore'

class Memos
  def self.set_storage(storage)
    @@storage = storage
  end

  def self.all
    store = PStore.new(@@storage)
    store.transaction do
      store['memos'] || []
    end
  end

  def self.add(memo)
    store = PStore.new(@@storage)
    store.transaction do
      memos = store['memos']
      memos = Array.new if memos.nil?
      memos << memo
      store['memos'] = memos
    end
  end
end
