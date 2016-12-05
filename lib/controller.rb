require 'bundler'
Bundler.require
Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each { |file| require file }
require_relative 'helpers/data_mapper'
require_relative 'helpers/warden'
require 'pry'
require 'sinatra/bootstrap'






class SlowFood < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::Warden
  register Sinatra::Bootstrap::Assets
  set :session_secret, "supersecret"

  #binding.pry
  #Create a test User
  if User.count == 0
   @user = User.create(username: "admin")
   @user.password = "admin"
   @user.save
  end

  use Warden::Manager do |config|
    # Tell Warden how to save our User info into a session.
    # Sessions can only take strings, not Ruby code, we'll store
    # the User's `id`
    config.serialize_into_session { |user| user.id }
    # Now tell Warden how to take what we've stored in the session
    # and get a User from that information.
    config.serialize_from_session { |id| User.get(id) }

    config.scope_defaults :default,
                          # "strategies" is an array of named methods with which to
                          # attempt authentication. We have to define this later.
                          strategies: [:password],
                          # The action is a route to send the user to when
                          # warden.authenticate! returns a false answer. We'll show
                          # this route below.
                          action: 'auth/unauthenticated'
    # When a user tries to log in and cannot, this specifies the
    # app to send the user to.
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env, opts|
    env['REQUEST_METHOD'] = 'POST'
  end

  get '/' do
    @dishes = Dish.all
    @starters = []
    @dishes.each do |dish|
      if dish.category == "Starter"
        @starters.push(dish)
      end
    end

    @main_courses = []
    @dishes.each do |dish|
      if dish.category == "Main Course"
        @main_courses.push(dish)
      end
    end

    @desserts = []
    @dishes.each do |dish|
      if dish.category == "Dessert"
        @desserts.push(dish)
      end
    end
    erb :index
  end

  post '/checkout' do
    @current_order = Order.get(session[:order_id])
    @total = 0
    if @current_order.nil?
      flash[:error] = "Your order is empty"
      redirect '/'
    else
      @current_order.order_items.each do |order_item|
        @total = @total + order_item.dish.price
        @current_order.amount = @total.round(2)
      end
      erb :checkout
    end
  end

  post '/add-to-order' do
    if session[:order_id]
      current_order = Order.get(session[:order_id])
    else
      current_order = Order.create
    end
    session[:order_id] = current_order.id
    dish = Dish.get(params[:dish_id])

    if current_order.order_items.create(dish: dish)
      flash[:success] = "added to order"
    else
      flash[:error] = "could not add to order"
    end
  redirect '/'
  end

  get '/order_confirmation' do
    @current_order = Order.get(session[:order_id])
    @current_order.pickup_time = (Time.now + 1800).strftime("%H:%M")
    erb :order_confirmation
  end

  get '/order_confirmation' do
    @current_order = Order.get(session[:order_id])
    @current_order.pickup_time = (Time.now + 1800)
    erb :order_confirmation
  end

  get '/auth/login' do
    erb :login
  end

  post '/auth/login' do
    env['warden'].authenticate!
    flash[:success] = "Successfully logged in #{current_user.username}"
    if session[:return_to].nil?
      redirect '/'
    else
      redirect session[:return_to]
    end
  end

  get '/auth/logout' do
    env['warden'].raw_session.inspect
    env['warden'].logout
    flash[:success] = 'Successfully logged out'
    redirect '/'
  end

  post '/auth/unauthenticated' do
    session[:return_to] = env['warden.options'][:attempted_path] if session[:return_to].nil?

    # Set the error and use a fallback if the message is not defined
    flash[:error] = env['warden.options'][:message] || 'You must log in'
    redirect '/auth/login'
  end

  get '/protected' do
    env['warden'].authenticate!

    erb :protected
  end
end
