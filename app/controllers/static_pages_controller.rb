class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def about; end

  def contact; end

  before_action :set_locale

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale = I18n.available_locales.include?(locale) ?
    locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
