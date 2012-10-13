class ImporterController < ApplicationController
	before_filter :require_signin

	def index
	end

	def upload
		return redirect_to importer_path, alert: "Please select a file." unless params.has_key? :tab_file
		begin
	    	@result = Order.import_from_text_file params[:tab_file].read, { headers: true, col_sep: "\t" }
	    rescue Exception => ex
	    	redirect_to importer_path, alert: "Error: #{ex.message}"
	    end
	end
end