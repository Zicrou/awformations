class CartController < ApplicationController
  def show
    @render_cart = false
    @show_cart = Orderable.all
    #debugger
  end

  def add
    if user_signed_in?
      @product = Product.find_by(id: params[:id])
      quantity = params[:quantity].to_i
      current_orderable = @cart.orderables.find_by(product_id: @product.id)
      if current_orderable && quantity > 0
        current_orderable.update(quantity:)
      elsif quantity <= 0 
        current_orderable.destroy
      else
        @cart.orderables.create(product: @product, quantity:)
      end
      
      #Increase the product number tag in the header
      @orderable_count= Orderable.count()
      #if @orderable_count > 0
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: [turbo_stream.replace('cart',
                                                        partial: 'cart/cart',
                                                        locals: {cart: @cart }),
                                  turbo_stream.replace(@orderable_count)]
          end
        end
    else
      redirect_to new_user_session_path
    end
    
  end

  def remove
    @orderable = Orderable.find_by(id: params[:id])
    if @orderable.destroy
      @orderable_count= Orderable.count()
      respond_to do |format|
        format.html { redirect_to cart_url, notice: "Product was successfully destroyed." }
        # format.turbo_stream do
        #   render turbo_stream: turbo_stream.replace('cart',
        #     partial: 'cart/cart',
        #     locals: {cart: @orderable_count })
        # end
      end
    else
      puts "Nothing happen!"
    end
  end

    #redirect_to cart, notice: "Produit à été supprimé avec succés."
end
