class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
  	@menus = [
  		{title: 'Categorías', icon:'fa fa-th-large', link: "/categories"},
  		{title: 'Productos', icon:'fa fa-glass', link: "/products"},
  		{title: 'Proveedores', icon:'fa fa-truck', link: "/providers"},
  		{title: 'Ordenes', icon:'fa fa-ticket', link: "/orders"},
  		{title: 'Ventas', icon:'fa fa-credit-card', link: "/sells"},
  		{title: 'Compras', icon:'fa fa-shopping-cart', link: "/purchases"},
  		{title: 'Usuarios', icon:'fa fa-group', link: "/users"},
  		{title: 'Salir', icon:'fa fa-send', link: "/logout"}
  	]
  end
end
