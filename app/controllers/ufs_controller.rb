class UfsController < ApplicationController
  def question
    # uf = Uf.find_by(date: params[:date])

    url = 'https://mindicador.cl/api/uf/'+params[:date]
    response = HTTParty.get(url)

    if response.body.nil? || response['serie'] == []
      render json: 'Valor no encontrado para la fecha ingresada'
    else 
      if request.headers['X-CLIENT'].present? && response['serie'] != []
        Search.create(date_query: params[:date], name: request.headers['X-CLIENT'])
        render json: response['serie'][0]['valor']
      else
        render json: 'Por favor, debe colocar en Header la key X-CLIENT y su nombre de cliente'
      end  
    end
  end

  def count_question
    count = Search.where(name: params[:name]).count 
    render json: count
  end

end