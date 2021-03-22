#stage1
FROM node:latest as node
WORKDIR /app
copy . .
RUN npm install
RUN npm run build --prod

#stage2
FROM nginx:latest
COPY --from=node /app/dist/msd /usr/share/nginx/html



#steps
#docker build -t msd .
#docker run --rm -d -p 80:80 msd
#docker tag msd prem7ranjan3/msd
#docker push prem7ranjan3/msd
