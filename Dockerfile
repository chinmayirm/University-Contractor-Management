FROM node:20-slim

WORKDIR /app

# Install dependencies first for better caching
COPY package*.json ./
RUN npm install

# Copy backend files
COPY backend/ ./backend/

# Copy frontend files
COPY frontend/ ./frontend/

# Install frontend dependencies
RUN cd frontend && \
    echo "Verifying package.json:" && \
    cat package.json && \
    npm install --omit=dev

# Build frontend
RUN cd frontend && npm run build

EXPOSE 3000 5000

CMD ["sh", "-c", "cd backend && node server.js & cd ../frontend && npm start"]