class GenealogysController < ApplicationController
  def new
  end

  def create
  end

  def index
    @families = Family.all.order('created_at desc')
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
