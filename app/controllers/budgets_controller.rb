class BudgetsController < ApplicationController

  def index
    budgets = Budget.all
    render json: budgets, include: [:expenses]
  end 

  def show
    budget = Budget.find_by(id: params[:id])
    render json: budget
  end 

  def create
    render json: Budget.create(budget_params), include: [:expenses]
  end 

  def update
    budget = Budget.find_by(id: params[:id])
    budget.update(budget_params)
    render json: budget
  end

  def delete
    Budget.destroy_all
  end 

end


private 

def budget_params
  params.require(:budget).permit(:income)
end