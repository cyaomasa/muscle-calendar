class Public::HomesController < ApplicationController
  
  def top
  end
  
  def calendar
    @post_records = current_user.post_records.all.all
  end
end
