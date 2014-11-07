class SnippetsController < ApplicationController
  def show
    @snippet = Snippet.find(snippet_id)
    render :show
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(create_params)

    if @snippet.save
      flash[:notice] = 'Snippet created successfully.'
      redirect_to edit_snippet_url(@snippet)
    else
      render :new
    end
  end
  
  def edit
    @snippet = Snippet.find(snippet_id)
  end

  def update
    @snippet = Snippet.find(snippet_id)
    if @snippet.update_attributes(update_params)
      redirect_to snippet_url(@snippet), notice: "Snippet updated successfully."
    else
      render :edit
    end
  end

  private

  def create_params
    params.require(:snippet).permit(:title, :content)
  end

  def update_params
    create_params
  end

  def snippet_id
    params.require(:id)
  end
end