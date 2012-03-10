Configus.build Rails.env do
  env :production do
    emails do
        sender_email "mail@darkleaf.ru"
    end

    host "darkleaf.ru"
  end

  env :development, :parent => :production
  env :test, :parent => :development do
    host "mypc:3000"
  end
end
