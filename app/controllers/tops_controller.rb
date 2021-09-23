class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_store, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :redirect_root, only: [:edit, :update]

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @store = Store.order('id DESC')
  end

  def new
    @store = Store.new
  end

  def show
  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store)
    else
      render :edit
    end
  end

  def destroy
    if @store.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def store_params
    params.require(:store).permit(:store_name, :image, :store_text, :store_noodle_id, :store_soup_id, :store_meat_id, :store_vegetable_id,
                                 :store_garlic_id, :store_oil_id).merge(user_id: current_user.id)
  end

  def set_store
    @store = Store.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @store.user
  end

  def redirect_root
    redirect_to action: :index if current_user.id == @store.user_id && @store.buy.present?
  end
end
