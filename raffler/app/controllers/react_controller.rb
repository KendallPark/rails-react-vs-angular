class ReactController < ApplicationController
  def index
    @entries = Entry.all
  end
end
