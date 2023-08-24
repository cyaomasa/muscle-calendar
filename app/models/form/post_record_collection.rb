class Form::PostRecordCollection < Form::Base
  
  # 作成したい登録フォーム数
  FORM_COUNT = 6
  attr_accessor :post_records

  def initialize(attributes = {})
    super attributes
    self.post_records = FORM_COUNT.times.map { PostRecord.new() } unless self.post_records.present?
  end
  
  def post_records_attributes=(attributes)
    self.post_records = attributes.map { |_, v| PostRecord.new(v) }
  end
  
  def save(user)
    PostRecord.transaction do
      self.post_records.map do |post_record|
        # チェックボックスにチェックを入れている投稿のみが保存される
        if post_record.availability 
          post_record.user_id = user.id
          post_record.save
        end
      end
    end
    true
    rescue => e
      false
  end
end
