module Api
    module V1
        class GlossariesController < ApplicationController
            def index
                @glossaries = Glossary.order('created_at DESC')
                render json: {status: 'SUCCESS',message: 'Glossaries',data: @glossaries},status: :ok
            end
            def show
                @glossary = Glossary.find(params[:id])
                render json: {status: 'SUCCESS',message: 'Single glossary',data: @glossary},status: :ok
            end
            def create 
                @glossary = Glossary.new(glossary_params)
                if @glossary.save
                    render json: {status: 'SUCCESS',message: 'Saved glossary',data: @glossary},status: :ok
                else 
                    render json: {status: 'ERROR',message: 'Glossary not saved',data: @glossary.errors},status: :unprocessable_entity
                end
            end
            def destroy 
                @glossary = Glossary.find(params[:id])
                @glossary.destroy
                render json: {status: 'SUCCESS',message: 'Deleted glossary',data: @glossary},status: :ok
            end
            def update
                glossary = Glossary.find(params[:id])
                if glossary.update(glossary_params)
                  render json: {status: 'SUCCESS', message:'Updated glossary', data:glossary},status: :ok
                else
                  render json: {status: 'ERROR', message:'glossary not updated', data:glossary.errors},status: :unprocessable_entity
                end
            end        
            private 
            def glossary_params
                params.permit(:source_code_lang,:target_lang_code)
            end
        end
    end
end