require 'rubygems'
require 'clickatell'
class SmsTextsController < ApplicationController
  before_action :set_sms_text, only: [:show, :edit, :update, :destroy]

  # GET /sms_texts
  # GET /sms_texts.json
  def index
    @sms_texts = SmsText.all

    respond_to do |format|
      format.html
      format.json { render json: @sms_texts }
    end
  end

  # GET /sms_texts/1
  # GET /sms_texts/1.json
  def show
  end

  # GET /sms_texts/new
  def new
    @sms_text = SmsText.new

    respond_to do |format|
      format.html
      format.json { render json: @sms_texts }
    end
  end

  # GET /sms_texts/1/edit
  def edit
  end

  # POST /sms_texts
  # POST /sms_texts.json
  def create
    api = Clickatell::API.authenticate(ENV['API_ID'], ENV['API_USER_NAME'], ENV['API_PASSWORD'])
    @sms_text = SmsText.new(sms_text_params)
    recipient = @sms_text.recipient
    sms_message = @sms_text.sms_message
    api.send_message(recipient, sms_message)
    respond_to do |format|
      if @sms_text.save
        format.html { redirect_to @sms_text, notice: 'Sms text was successfully created.' }
        format.json { render json: @sms_text, status: :created, location: @sms_text }
      else
        format.html { render :new }
        format.json { render json: @sms_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms_texts/1
  # PATCH/PUT /sms_texts/1.json
  def update
    respond_to do |format|
      if @sms_text.update(sms_text_params)
        format.html { redirect_to @sms_text, notice: 'Sms text was successfully updated.' }
        format.json { render :show, status: :ok, location: @sms_text }
      else
        format.html { render :edit }
        format.json { render json: @sms_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_texts/1
  # DELETE /sms_texts/1.json
  def destroy
    @sms_text.destroy
    respond_to do |format|
      format.html { redirect_to sms_texts_url, notice: 'Sms text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sms_text
    @sms_text = SmsText.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sms_text_params
    params.require(:sms_text).permit(:recipient, :sms_message)
  end
end
