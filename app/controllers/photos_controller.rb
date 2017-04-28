class PhotosController < ApplicationController
  def index
    @all_photos = Photo.all
    render("photos/index.html.erb")
  end
  def show
    id = params[:id]
    @photo = Photo.find(id)
    render("photos/show.html.erb")
  end
  def new_form
    render("photos/new_form.html.erb")
  end
  def create_row
    url = params[:source]
    cap = params[:caption]
    new_photo = Photo.new
    new_photo.caption = cap
    new_photo.source = url
    new_photo.save
    # we don't want to render here (it loads up a view template)
    redirect_to("/photos")
    # redirect_to("/photos/#{new_photo.id}")
  end
  def edit_form
    id = params[:id]
    @photo = Photo.find(id)
    render("photos/edit_form.html.erb")
  end
  def update_row
    id = params[:id]
    url = params[:source]
    cap = params[:caption]
    photo = Photo.find(id)
    photo.source = url
    photo.caption = cap
    photo.save
    redirect_to("/photos/#{photo.id}")
  end
  def destroy_row
    id = params[:id]
    photo_to_destroy = Photo.find(id)
    photo_to_destroy.destroy
    redirect_to("/photos")
  end
end
