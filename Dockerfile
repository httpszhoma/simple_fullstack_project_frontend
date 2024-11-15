# Используем официальный образ Node.js для сборки
FROM node:14

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm install

# Копируем остальные файлы проекта
COPY . .

# Собираем приложение
RUN npm run build

# Устанавливаем сервер для обслуживания статических файлов
RUN npm install -g serve

# Открываем порт для работы приложения
EXPOSE 3000

# Запускаем сервер для обслуживания приложения
CMD ["serve", "-s", "build", "-l", "3000"]
