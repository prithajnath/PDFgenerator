class PdfsController < ApplicationController

  def index
  end

  def new
    temp_file = "#{::Rails.root}/public/mlhpdf"       
    Prawn::Document.generate("whatever.pdf", :skip_page_creation => true) do |f|
      f.start_new_page(:template => temp_file, :template_page => 1)
      send_data f.render,disposition:"inline"
    end	
  end   

  def fullbook
    temp_file = "#{::Rails.root}/public/mlhpdf"       
    Prawn::Document.generate("whatever.pdf", :template => temp_file) do |f|
      send_data f.render,disposition:"inline"
    end	
  end 

end
