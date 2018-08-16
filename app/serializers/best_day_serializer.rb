class BestDaySerializer < ActiveModel::Serializer
  attributes :best_day

  def best_day
    object.most_sold_by_day
  end

end
