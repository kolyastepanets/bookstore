module CheckoutsHelper
  def current_checkout
    @checkout.order
  end
end
