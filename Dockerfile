#STAGE-1
FROM node:alpine3.16 as nodework
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
#RUN npm run build

# #STAGE-2
# FROM nginx:1.23.0-alpine
# WORKDIR /usr/share/nginx/html
# RUN rm -rf ./*
# COPY --from=nodework /app/build/ .
#ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

# Uses port which is used by the actual application
EXPOSE 3000
 
# Finally runs the application
CMD [ "npm", "start" ]
