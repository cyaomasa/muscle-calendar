class Public::HomesController < ApplicationController
  
  def top
  end
  
  def calendar
    @post_records = PostRecord.all
  end
end
