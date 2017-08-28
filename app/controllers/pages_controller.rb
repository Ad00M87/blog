class PagesController < ApplicationController
  # Responsible for showing all pages.
  def index
    # if we want our view to have access to the var
    # we need an instance variable
    @pages = Page.all
    # render: index
  end

  # Showing a specific page.
  def show
    @page = Page.find(params[:id])
    # render: show - app/views/pags/show.html.erb
  end

  # Showing a form to edit an existing page.
  def edit
    @page = Page.find(params[:id])
    # render: edit - app/views/pages/edit.html.erb
  end

  # Responsible for showing a form to create a new page.
  def new
    @page = Page.new
    # render: new - app/views/pages/show.htmls.erb
  end

  # Responsible for saving a new record in our database.
  def create
    # Strong Params
    page = Page.new(page_params)
    # executes the sql to try to save the new page in the database
    if page.save
      # success - new record in the database
      redirect_to page_path(page)
    else
      # fail = failed to execute the sql for some reason
      render :new
    end
  end

  def destroy
    page = Page.find(params[:id])
    page.destroy
    redirect_to pages_path
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      #success
      redirect_to page_path(@page)
    else
      #fail
      render :edit
    end
  end

  private
    def page_params
      params.require(:page).permit(:title, :author, :body, :private)
    end

end
