class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Чтобы метод current_user был доступен в шаблона, нам необходимо объявить
  # его с помощью метода helper_method. Эта строка как бы говорит рельсам:
  # если в шаблоне встретишь current_user — не пугайся, что такого метода нет,
  # дерни этот метод у контроллера.
  helper_method :current_user

  private

  # Метод контроллера, достающий текущего юзера из базы по данным аутентификации
  # в сессии.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Метод, который редиректит посетителя на главную с предупреждением о
  # нарушении доступа. Мы будем использовать этот метод, когда надо запретить
  # пользователю что-то.
  def reject_user
    redirect_to root_path, alert: 'Вам сюда низя!'
  end
end
