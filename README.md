# 🎮 Tic Tac Toe - Website with CI/CD Pipeline

A fully-automated Tic Tac Toe game deployed to AWS ECS Fargate via GitHub Actions.

# 🏗️ Architecture

GitHub (main) → GitHub Actions → ECR → ECS Fargate → ALB → Internet

# 🔄 CI/CD Pipeline

Triggers: Push to main branch

Flow:

Build Docker image with index.html, style.css, app.js

Push to ECR (140352704906.dkr.ecr.us-east-2.amazonaws.com/tictactoe:latest)

Update ECS task definition with new image

Deploy → ECS rolls out new tasks (zero-downtime)

Workflow files:

.github/workflows/deploy-ecs.yml - Full CI/CD pipeline

# 🔧 Local Development

Edit files, test locally

docker build -t tictactoe-local .

docker run -p 8080:80 tictactoe-local

http://localhost:8080

# 🚀 Deploy Changes
git add .

git commit -m "Update game UI"

git push origin main

~2 minutes later: New version live on Fargate!

📋 Docker (Nginx)

FROM nginx:alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY . /usr/share/nginx/html

EXPOSE 80

Serves: index.html on port 80 to Fargate's public IP.

# 🙌 Credits

Built with ❤️ using:

GitHub Actions - CI/CD

AWS ECS Fargate - Serverless containers

AWS ECR - Docker registry

Nginx Alpine - Static file server

## License
MIT © Cyber-Cross

