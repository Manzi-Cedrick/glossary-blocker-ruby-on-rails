module Api
    module V1
        class TranslationController < ApplicationController
            def index
                @translations = Translation.all;
                render json: {status: 'SUCCESS',data: @translations},status: :ok
            end
            
            # def show
            #     @translation = Translation.find(params[:id])
            #     render json: {status: 'SUCCESS',message: 'Single translation.',data: @translation},status: :ok
            # end
            def create
                # glossary_id = params[:translation][:glossary_id]
                @glossary = Glossary.find(params[:glossary_id])
                if @glossary.source_code_lang == params[:translation][:source_language_code]
                    @translation = Translation.new(translation_params)
                    if @translation.save
                        render json: {status: 'SUCCESS',message:'translation added', data: @translation}, status: :ok
                    else
                        render json: {status: 'ERROR', message:'not added',data: @translation.errors}, status: :unprocessable_entity
                    end
                else
                    render json: {status: 'Unprocessable',message:'Source code does not match'}, status: :unprocessable_entity
                end
            end
            def show
                @translation = Translation.find(params[:id])
                source_text = @translation.source_text
                glossary_id = @translation.glossary_id
                matching_terms = []
                @terms_all = Term.joins(:glossary).where(glossary: {id: glossary_id})
                allTerms = @terms_all.pluck(:source_term)
                allTerms.each do |term|
                    source_term = term
                    if source_text.include?(source_term)
                        source_text.gsub!(source_term,"<HIGHLIGHT>#{source_term}</HIGHLIGHT>")
                        matching_terms << term
                    end
                end
                render json: {status: 'SUCCESS',terms: allTerms, highlighted_text: source_text, matching_terms: matching_terms}, status: :ok
            end
            private
            
            def translation_params
                params.require(:translation).permit(:source_language_code,:target_language_code,:source_text,:glossary_id)
            end
        end 
    end
end