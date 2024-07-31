# Use the official Node.js 18 image as the base image
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js app
RUN npm run build

# Use the official Node.js 18 image as the base image for the final image
FROM node:18-alpine AS runner

# Set the working directory inside the container
WORKDIR /app

# Install 'serve' to serve the Next.js app
RUN npm install -g serve

# Copy the built application from the builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/public ./public

# Set environment variable to production
ENV NODE_ENV production

# Expose the port that the app runs on
EXPOSE 3000

# Start the Next.js app using 'serve'
CMD ["serve", "-s", ".next", "-l", "3000"]
