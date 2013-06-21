class UsuarioSessionsController < ApplicationController
	def new
		@usuario = Usuario.new
	end
	def create
		if @usuario = login(params[:username],params[:password])
			redirect_back_or_to(posts_path, message: "Login exitoso")
		else
			flash.now[:alert] = "Algo salio mal con el login"
			render action: :new
		end
	end
	def destroy
		logout
		redirect_to(:usuarios, message: "Fin de sesión")
	end
end