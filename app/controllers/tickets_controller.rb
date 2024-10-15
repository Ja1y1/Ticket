class TicketsController < ApplicationController
  
  # GET /tikts
  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  # GET /tickets/:id/qr
  def show_qr
    @ticket = Ticket.find_by(id: params[:id])
    if @ticket 
    @qrcode = RQRCode::QRCode.new(@ticket.code.to_s)
   
   
     #  @tikt = Tikt.last
      # @code = @tikt.code
   
   #print @qrcode
   
   #@qrcode = RQRCode::QRCode.new(@code)
   
   @svg = @qrcode.as_svg(
         offset: 0,
         color: '000',
         shape_rendering: 'crispEdges',
         module_size: 6,
         ).strip
   
   
   Rails.logger.debug("SVG Output (first 100 chars): #{@svg[0..99]}")
   Rails.logger.debug("SVG Output (last 100 chars): #{@svg[-100..-1]}")
   
   
       if @svg.strip.empty?
         Rails.logger.error("Generated SVG is empty!")
      render plain: "Error: SVG generation failed", status: :internal_server_error
         return
       end
       render plain: @svg, content_type: 'image/svg+xml', status: :ok
   
   else
   head :no_content
   end 
  end

  # GET /tikts/1
  def show
 	  @ticket = Ticket.find_by(id: params[:id])
    if @ticket 
      render json: @ticket
    else
      head :no_content 
    end
  end

  # POST /tikts
  def create
    @ticket = Ticket.new

    if @ticket.save
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tikts/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tikts/1
  def destroy
    @ticket.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:code)
    end
end
