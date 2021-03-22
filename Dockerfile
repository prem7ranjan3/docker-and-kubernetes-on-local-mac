#stage1
FROM node:latest as node
WORKDIR /app
copy . .
RUN npm install
RUN npm run build --prod

#stage2
FROM nginx:latest
COPY --from=node /app/dist/msd /usr/share/nginx/html
