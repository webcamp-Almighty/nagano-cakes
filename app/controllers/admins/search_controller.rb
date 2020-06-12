class Admins::SearchController < ApplicationController

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
    #binding.pry
  end

  private
  def search_for(model, content, method)
    if model == 'end_user'
      if method == 'perfect'
        EndUser.where("(last_name || first_name) like ?", content)
      elsif method == 'forward'
        EndUser.where("(last_name || first_name) like ?", content+'%')
      elsif method == 'backward'
        EndUser.where("(last_name || first_name) like ?", '%'+content)
      else
        EndUser.where("(last_name || first_name) like ?", '%'+content+'%')
      end
    elsif model == 'item'
      if method == 'perfect'
        Item.where(name: content)
      elsif method == 'forward'
        Item.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        Item.where('name LIKE ?', '%'+content)
      else
        Item.where('name LIKE ?', '%'+content+'%')
      end
    end
  end


    # def search
  # 	@model = params["search"]["model"]
  # 	#binding.pry
  # 	@content = params["search"]["content"]
  # 	@how = params["search"]["how"]
  # 	#no_data
  # 	@datas = search_for(@model, @content, @how)
  # end

  # private
  # def match(model, content)
  #   if model == 'end_user'
  #     EndUser.where(last_name: content)#
  #   elsif model == 'item'
  #     Item.where(name: content)
  #   end
  # end

  # def forward(model, content)
  #   if model == 'end_user'
  #     EndUser.where("last_name LIKE ?", "#{content}%")
  #   elsif model == 'item'
  #     Item.where("name LIKE ?", "#{content}%")
  #   end
  # end

  # def backward(model, content)
  #   if model == 'end_user'
  #     EndUser.where("last_name LIKE ?", "%#{content}")
  #   elsif model == 'item'
  #     Item.where("name LIKE ?", "%#{content}")
  #   end
  # end

  # def partical(model, content)
  #   if model == 'end_user'
  #     EndUser.where("last_name LIKE ?", "%#{content}%")
  #   elsif model == 'item'
  #     Item.where("name LIKE ?", "%#{content}%")
  #   end
  # end

  # def search_for(how, model, content)
  #   case how
  #   when 'match'
  #     match(model, content)
  #   when 'forward'
  #     forward(model, content)
  #   when 'backward'
  #     backward(model, content)
  #   when 'partical'
  #     partical(model, content)
  #   end
  # end

end
