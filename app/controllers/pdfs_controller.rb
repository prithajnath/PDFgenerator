class PdfsController < ApplicationController

  def index
  end

  def new
    
    temp_file = "#{::Rails.root}/public/mlhpdf"       
    Prawn::Document.generate("gendoc.pdf", :template => temp_file) do |f|
      send_data f.render	    
    end	
  end    




end
