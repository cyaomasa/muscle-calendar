class Form::PostRecordCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :post_records

  def initialize(attributes = {})
    super attributes
    self.post_records = FORM_COUNT.times.map { PostRecord.new() } unless self.post_records.present?
  end
  
  # 上でsuper attributesとしているので必要
  def post_records_attributes=(attributes)
    self.post_records = attributes.map { |_, v| PostRecord.new(v) }
  end

  def save
    # 実際にやりたいことはこれだけ
    # self.memos.map(&:save!)

    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    PostRecord.transaction do
      self.post_records.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end
