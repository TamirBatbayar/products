class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
 
  # GET /products
  # GET /products.json

  def import_page
    
  end

  def import
    Product.import(params[:file])
    @csv_text = File.read('/home/itet/Documents/products.csv')
    @csv = CSV.parse(@csv_text, :headers => true)
    # @csv.each do |row|
    #   row.to_hash
    # end

    # raise @csv.first.to_hash['detail'].to_yaml
    # redirect_to import_page_path, notice: "Products imported"
    
  end

  def index
    if params[:search]
      # raise params[:search].to_yaml
      @search = Product.search(params[:search])
      @products = @search.paginate(:page => params[:page], :per_page => 10)
    else
      @search = Product.ransack(params[:q])
      @products = @search.result.paginate(:page => params[:page], :per_page => 10)
      @search.build_condition if @search.conditions.empty?
      @search.build_sort if @search.sorts.empty?
    end


    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
 end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    # supplier_id = Random.new
    # for i in 43470..1000000
    #   @product = Product.new(
    #     :name => "product#{i}",
    #     :price => 100,
    #     :detail => "product#{i}-detail",
    #     :supplier_id => supplier_id.rand(1..20) # Deed tal n 20 supplier bga gej bodoy
    #     )

    #   @product.save
      # if i == 10
      #   raise @product.supplier_id.to_yaml
      # end
    # end


    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :supplier_id, :detail)
    end

    # Restrict access for API
    # def restrict_access
    #     api_key = ApiKey.find_by_access_token(params[:access_token])
    #     head :unauthorized unless api_key
    # end


end
