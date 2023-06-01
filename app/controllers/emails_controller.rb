class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    email = Email.new(
      address: Faker::Internet.email,
      object: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraphs.join("\n\n")
    )
  
    respond_to do |format|
      if email.save
        format.html { redirect_to emails_path }
        format.turbo_stream { redirect_to emails_path, status: :turbo_stream }
      else
        format.html { render :new }
        format.turbo_stream { render turbo_stream: turbo_stream.replace('email_form', partial: 'form', locals: { email: email }) }
      end
    end
  end  

  def show
  end

  def index
    @emails = Email.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
