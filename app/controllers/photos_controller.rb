class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :edit_tags, :update_tags]
  before_action :set_tags, only: [:edit, :update, :edit_tags, :update_tags]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET
  def edit_tags
  end

  # POST
  def update_tags
    @photo.tags = []
    params[:tags].keys.each do |tag_id|
      @photo.tags << Tag.find_by_id(tag_id)
    end
    redirect_to edit_tags_photo_path
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @photo.comments.build
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        @photo.tags = []
        params[:tags].keys.each do |tag_id|
          @photo.tags << Tag.find_by_id(tag_id)
        end
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_tags
      @tags = Tag.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:name,
          comments_attributes: [:id, :title, :body, :_destroy])
    end
end
