class Admins::HomesController < ApplicationController
  def top
   @from = Time.now.in_time_zone("Tokyo").beginning_of_day
   @to   = Time.now.in_time_zone("Tokyo").end_of_day
   @today = Order.where(created_at: @from..@to)
  end
end


#Order.where(created_at: 1.day.ago.all_day)// 1日前
#Order.where(created_at: Time.zone.now.all_day)//今日

#Time.now.in_time_zone("Tokyo").beginning_of_day //今日の始まり
#Time.now.in_time_zone("Tokyo").end_of_day //今日の終わり

   #@from = '2020-06-09 00:00:00'
   #@to = '2020-06-10 00:00:00'
   #@count= Order.where(created_at: @from..@to)
