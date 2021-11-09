class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    id = params[:id]
    @company = Company.find(id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if (@company.save)
      redirect_to companies_path, notice: 'Company successful created'
    else
      flash[:error] = 'Company has errors' 
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to companies_path, notice: 'User successfully updated'
    else
      flash[:error] = "Couldn't update company"
      render :edit
    end    
  end    

  def destroy
    id = params[:id]
    company = Company.find(id)
    company.destroy
    redirect_to company_path, notice: "L'entreprise #{company.name} avec l'email #{company.email} a été supprimé"
  end

  private
  def company_params
    params.require(:company).permit(:name, :email)
  end
end
