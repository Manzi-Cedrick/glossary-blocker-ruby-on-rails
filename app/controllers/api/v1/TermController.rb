module Api
    module V1
        class TermController < ApplicationController
            def index
                @terms = Term.all;
                render json: {status: 'SUCCESS',data: @terms},status: :ok
            end
            
            def show
                @term = Term.find(params[:id])
            end
            def create
                @term = Term.new(term_params)
                if @term.save
                    render json: {status: 'SUCCESS', data: @term}, status: :ok
                else
                    render json: {status: 'ERROR', data: @term.errors}, status: :unprocessable_entity
                end
            end
            
            private
            
            def term_params
                params.require(:term).permit(:source_term,:target_term,:glossary_id)
            end
        end 
    end
end