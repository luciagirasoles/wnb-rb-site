# frozen_string_literal: true

class SiteController < ApplicationController
  before_action :add_gtoken, only: :join_us

  def home; end

  def join_us; end

  def sponsor_us; end

  def meetups; end

  def jobs; end

  def jobs_authenticate; end

  def donate; end

  def past_meetup
    return unless params[:year].present? && params[:month].present? && params[:day].present?
    @year = params[:year]
    @month = params[:month]
    @day = params[:day]
  end

  private

  def add_gtoken
    @gtoken = ENV.fetch('RECAPTCHA_SITE_KEY', nil) if ENV.fetch('RECAPTCHA_ENABLED', nil) == 'true'
  end
end
