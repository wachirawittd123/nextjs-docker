# ใช้ node official image
FROM node:20-alpine

# สร้าง working directory
WORKDIR /app

# copy package.json และ package-lock.json ก่อน เพื่อ cache layers
COPY package*.json ./

# install dependencies
RUN npm install

# copy โค้ดที่เหลือ
COPY . .

# build next.js
RUN npm run build

# expose port
EXPOSE 3000

# start next.js
CMD ["npm", "run", "start"]
