echo "Copying NGINX config"
mkdir -p /etc/nginx/conf.d
cp nginx.conf /etc/nginx/conf.d/brochure.conf
echo "Starting Sinatra app"
ruby app.rb -o 0.0.0.0