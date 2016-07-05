class PdfsController < ApplicationController

  def index
  end
=begin
  def new
    respond_to do |f|
      f.html
      f.pdf do	      
       pdf = Prawn::Document.new
       pdf.text "Hello World"
       send_data pdf.render
      end
    end  
  end
=end
  def new
    temp_file = "#{::Rails.root}/public/mlh.pdf"
    respond_to do |f|
      f.html
      f.pdf do
       
        prawn_pdf = Prawn::Document.generate(temp_file) do |fat|    
        #@document.process(fat)
          fat.render
          page_total = fat.page_count-1  
        end	
        send_data prawn_pdf.render
      end

    end

  end
