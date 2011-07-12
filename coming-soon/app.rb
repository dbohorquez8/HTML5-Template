require 'application.rb'

get '/' do
  erb :index
end

post '/create' do
  email = Email.new
  email.email = params[:email]
  email.type_user = params[:type_user]
  email.created_at = Time.now
  if email.save
    redirect "/", :notice => '¡Gracias por registrarte! Pronto recibirás noticias de El Heraldo - Empleos'
  else
    email.errors.each do |e|
      redirect "/", :error => e
    end
  end
end

get '/admin' do
  unless requires_authorization!
    @emails = Email.all
    @personas = Email.count(:conditions => ["type_user = ?", 'Persona'])
    @email_count = Email.count
    erb :list
  end
end

get '/reset' do
  unless requires_authorization!
    emails = Email.all
    emails.each do |email|
      email.destroy
    end
  end
end

get '/export_csv' do
  unless requires_authorization!
    csv_content = FasterCSV.generate do |csv|
      emails = Email.all
      emails.each do |email|
        csv << [email.email, email.type_user, email.created_at.strftime("%B %d, %Y, %I:%M:%S %p")]
      end
    end
    headers "Content-Disposition" => "attachment;filename=emails.csv",
    "Content-Type" => "text/csv"
    csv_content
  end
end