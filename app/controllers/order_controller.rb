class OrderController < ApplicationController
  
    get "/orders" do
      
     if logged_in?
          @user = current_user 
          @order = @user.orders
          @orders = Order.all
          erb :"orders/index"
      else
          redirect "/login"
      end
    end 

    get '/orders/new' do
      erb :"orders/new"
    end

   
    get "/orders/:id" do 
        @order = Order.find_by(id:params[:id])
        if @order 
          erb :"orders/show"
        else 
          redirect "/orders"
        end  

    end 

     get '/orders/:id/edit' do 
       @order = Order.find_by(id:params[:id])
       erb :"orders/edit"
     end

    patch '/orders/:id' do 
       @order = Order.find_by(id:params[:id])
       params[:order][:picked] = params[:order][:picked]? true : false

         if @order.update(params[:order])
             redirect "/orders/#{@order.id}"
         else
             redirect "/orders/#{@order.id}/edit"
         end
     end

     post '/orders' do
        #binding.pry
  #     params[:picked] = params[:picked]? true : false
       @order = Order.new(params)
       if @order.save
           redirect "/orders/#{@order.id}"
       else
           redirect "/orders/new"
       end 
       #binding.pry
     end
      
   delete '/orders/:id' do
     order = Order.find_by(id:params[:id])
     if order.destroy
         redirect "/orders"
     else
         redirect "/orders/#{order.id}"
     end 
   end



end 