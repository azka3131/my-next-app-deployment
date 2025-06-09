# Gunakan image dasar Node.js versi 18-alpine yang ringan
FROM node:18-alpine

# Tetapkan direktori kerja di dalam container
WORKDIR /app

# Salin package.json dan package-lock.json terlebih dahulu
# Ini memanfaatkan cache Docker agar `npm install` tidak selalu dijalankan jika tidak ada perubahan dependensi
COPY package*.json ./

# Instal semua dependensi proyek
RUN npm install

# Salin sisa kode aplikasi ke dalam container
COPY . .

# Jalankan proses build Next.js untuk produksi
RUN npm run build

# Beri tahu Docker bahwa container akan berjalan di port 3000
EXPOSE 3000

# Perintah default untuk menjalankan aplikasi saat container dimulai
CMD ["npm", "start"]