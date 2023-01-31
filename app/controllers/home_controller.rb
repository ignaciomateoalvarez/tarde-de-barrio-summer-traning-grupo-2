class  HomeController< ApplicationController
    around_action :use_locale

  def login
    flash[:notice] = t(:hello)
  end

  private

  def use_locale(&block)
    I18n.with_locale(:es, &block)
  end
end