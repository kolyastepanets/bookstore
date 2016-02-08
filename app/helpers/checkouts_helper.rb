module CheckoutsHelper
  def current_order
    @order
  end

  def cc_years
    yrs = []
    year_today = Date.today.strftime("%Y").to_i
    year_today.upto(year_today+10).each do |y| yrs << y.to_s;end
    return yrs
  end

  def cc_months
    ['01','02','03','04','05','06','07','08','09','10','11','12']
  end

  def hidden_number_card
    num = @processing_order.credit_card.number.to_s
    '*' * 2 + " " + '*' * 2 + " " + "*" * 2 + " " + num[-4..-1]
  end

  def month_and_year
    month = @processing_order.credit_card.expiration_month.to_s
    year = @processing_order.credit_card.expiration_year.to_s
    month + "/" + year
  end

  def hidden_number_card_order
    num = @order.credit_card.number.to_s
    '*' * 2 + " " + '*' * 2 + " " + "*" * 2 + " " + num[-4..-1]
  end

  def month_and_year_order
    month = @order.credit_card.expiration_month.to_s
    year = @order.credit_card.expiration_year.to_s
    month + "/" + year
  end

end
