class CapesController < ApplicationController
    def index
        @capes = Cape.all
        @capes_grid = initialize_grid(Cape,
            order:                  'capes.project_name',
            order_direction:        'asc',
            name:                   'capes',
            enable_export_to_csv:   true,
        )
        export_grid_if_requested('capes' => 'capes_grid')
    end
    
    def show
        @cape = Cape.find(params[:id])
    end
    
    def new
        @cape = Cape.new
    end
    
    def edit
        @cape = Cape.find(params[:id])
    end
    
    def create
        @cape = Cape.new(cape_params)
        if @cape.save
            redirect_to :root
        else
            @errors = @cape.errors
            render :new
        end
    end
    
    def update
        @cape = Cape.find(params[:id])
        if @cape.update(cape_params)
            redirect_to :root
        else
            @errors = @cape.errors
            render :edit
        end
    end
    
    def destroy
        @cape = Cape.find(params[:id])
        @cape.destroy
        redirect_to :root
    end
    
    def tags
        render :json =>
            [
                {"id":"1","name":"Animal Disease"},
                {"id":"2","name":"Biological"},
                {"id":"3","name":"Biological, Communication, Consequence Management, Countermeasure Efficacy, Ethics"},
                {"id":"4","name":"Biosurveillance"},
                {"id":"5","name":"CBRNE"},
                {"id":"6","name":"Chemical"},
                {"id":"7","name":"Communication"},
                {"id":"8","name":"Consequence Management"},
                {"id":"9","name":"Countermeasure Efficacy"},
                {"id":"10","name":"Critical Infrastructure"},
                {"id":"11","name":"Curriculum Development"},
                {"id":"12","name":"Database"},
                {"id":"13","name":"Emergency Management"},
                {"id":"14","name":"Engineered Pathogens"},
                {"id":"15","name":"Environmental Stability"},
                {"id":"16","name":"Ethics"},
                {"id":"17","name":"Evaluation"},
                {"id":"17","name":"Exercise"},
                {"id":"18","name":"Facilitation"},
                {"id":"19","name":"Food Safety"},
                {"id":"20","name":"Grant Support"},
                {"id":"21","name":"HSEEP"},
                {"id":"22","name":"Healthcare"},
                {"id":"23","name":"Infectious Disease"},
                {"id":"24","name":"Influenza"},
                {"id":"25","name":"International"},
                {"id":"26","name":"Interviews"},
                {"id":"27","name":"Literature Research"},
                {"id":"28","name":"MCM"},
                {"id":"29","name":"Marketing"},
                {"id":"30","name":"Modeling"},
                {"id":"31","name":"Nuclear"},
                {"id":"32","name":"On-site Staff"},
                {"id":"33","name":"Planning"},
                {"id":"34","name":"Plant Disease"},
                {"id":"35","name":"Private Sector"},
                {"id":"36","name":"Program Support"},
                {"id":"37","name":"Public Health"},
                {"id":"38","name":"Publication Surveillance"},
                {"id":"39","name":"Radiological"},
                {"id":"40","name":"Radiological, Population Monitoring"},
                {"id":"41","name":"Risk Assessment"},
                {"id":"42","name":"SAS"},
                {"id":"43","name":"SLTT"},
                {"id":"44","name":"Science Writing"},
                {"id":"45","name":"Setting Requirements"},
                {"id":"46","name":"Strategic Planning"},
                {"id":"47","name":"Supply Chain Management"},
                {"id":"48","name":"Synthetic Biology"},
                {"id":"49","name":"Technology Assessment"},
                {"id":"50","name":"Tool Development"},
                {"id":"51","name":"Training"},
                {"id":"52","name":"Working Group"}
            ]
    end
    
    private
    
    def cape_params
        params.require(:cape).permit(:project_name, :contract_title, :tag_list, :capes_tags, :project_description, :pd_pm,
        :prime_sub, :client, :end_client, :client_poc_address, :client_poc_name_contact, :reference, :contract_number,
        :contract_value, :period_of_performance, :notes)
    end

end
