class MembersController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = current_user.members
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = current_user.members.build
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_path, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_path, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import_csv
  end

  def import
   # binding.pry
    if params[:file]
      user_id = current_user.id
      members = Member.import(params[:file], user_id)
      if members
        redirect_to members_path, notice: 'CSV imported successfully'
      else
        redirect_to mass_sms_import_csv_path, notice: 'Invalid CSV'
      end
    else
      render :import_csv, notice: 'Please Select CSV file'
      # redirect_to mass_sms_import_csv_path, notice: 'Please Select CSV file'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      binding.pry

      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :contact, :user_id)
    end
end
