FROM node:8.11.1-alpine as builder
USER node
RUN mkdir -p /tmp/app
WORKDIR /tmp/app
COPY ./package*.json ./
RUN npm install
COPY --chown=node . .
RUN npm run build

FROM nginx:1.13.12-alpine
WORKDIR /var/www/app
COPY --from=builder /tmp/app/dist/ /var/www/app/
# Expose the port on which your NextJS application will run (change as per your application)
EXPOSE 3000

# Run application when the container starts
CMD ["npm", "start"]
