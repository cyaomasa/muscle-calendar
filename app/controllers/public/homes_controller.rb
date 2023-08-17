class Public::HomesController < ApplicationController
  
  def top
  end
  
  def calendar
    @post_records = current_user.post_records.all
    @this_week_post_record = @post_records.created_this_week
    @last_week_post_record = @post_records.created_last_week
    @this_month_post_record = @post_records.created_this_month
    @last_month_post_record = @post_records.created_last_month
  end
  
end
