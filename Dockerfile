FROM node:14-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build is the folder that will have everything we care about. 


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html