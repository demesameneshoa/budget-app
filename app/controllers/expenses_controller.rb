class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    category_id = params[:category_id]
    order = params[:order] || 'desc' # Default to descending order if not provided

    @category = Category.find(category_id)
    @expenses = @category.expenses.order(created_at: order)
  end

  # GET /expenses/1 or /expenses/1.json
  def show; end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @categories = current_user.categories.all
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      @expense.category_ids = params[:expense][:category_ids] if params[:expense][:category_ids].present?

      redirect_to category_expenses_path
    else
      render html: @expense.errors.full_messages
    end
  end

  # GET /expenses/1/edit
  def edit; end

  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expense_url(@expense), notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1 or /expenses/1.json
  def destroy
    @expense.destroy!

    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id, category_ids: [])
  end
end
