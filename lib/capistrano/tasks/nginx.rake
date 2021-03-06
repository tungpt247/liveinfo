namespace :nginx do
  desc "Nginx tasks"

  %w(start stop restart reload).each do |task_name|
    desc "#{task} Nginx"
    task task_name do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "service nginx #{task_name}"
      end
    end
  end

end
