class Public::HomesController < ApplicationController
  def top
    @post_records = PostRecord.all
  end
end
