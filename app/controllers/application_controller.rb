class ApplicationController < ActionController::Base
    before_action :set_render_cart
    before_action :initialize_cart
    before_action :count_orderable

    def set_render_cart
      @render_cart = true
    end

    def initialize_cart
      @cart ||= Cart.find_by(id: session[:cart_id])

      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end

    def count_orderable
      #Increase the product number tag in the header
      @orderable_count = Orderable.count()
    end

end
