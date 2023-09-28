class LineItemsController < ApplicationController
    def add_to_cart
      @id_cour = params[:id]
      binding.break
    end
end
