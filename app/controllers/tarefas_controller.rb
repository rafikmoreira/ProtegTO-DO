class TarefasController < ApplicationController
    before_action :is_creator, only: [:destroy, :update]

    def index
      @tarefa = Tarefa.where("visibilidade=? OR user_id=?", 0, @user.id).order("created_at DESC")
      @tarefa = @tarefa.where(status: 1) if params[:completed]
      @tarefa = @tarefa.where(user_id: @user.id) if params[:private]
      render json: @tarefa, status: :ok
    end
  
    def show
      @tarefa = Tarefa.find(params[:id])
      if @tarefa.user_id == @user.id || @tarefa.visibilidade == 0
        return render json: @tarefa, status: :ok
      else
        return render json: {message: "Não autorizado"}, status: :unauthorized
      end
    end
  
    def create
      @tarefa = @user.tarefas.create(tarefa_params)
      render json: @tarefa, status: :ok
    end
  
    def update
      @tarefa = Tarefa.find(params[:id])
      if @tarefa.status == 1
        return render status: :unauthorized
      end
      @tarefa.update(tarefa_params)    
      render json: @tarefa, status: :ok
    end
  
    def destroy
      @tarefa = Tarefa.find(params[:id])
      @tarefa.destroy
      render status: :ok
    end

    private

    def is_creator
      @tarefa = Tarefa.find(params[:id])
      if @tarefa.user_id != @user.id
        return render json: {message: "Não autorizado"}, status: :unauthorized
      end
    end

    def tarefa_params
      params.permit(:titulo, :descricao, :visibilidade, :status)
    end
end

