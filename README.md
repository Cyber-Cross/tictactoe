🎮 Tic Tac Toe - Website with CI/CD Pipeline
A fully-automated Tic Tac Toe game deployed to AWS ECS Fargate via GitHub Actions.

🏗️ Architecture
GitHub (main) → GitHub Actions → ECR → ECS Fargate → ALB → Internet
     ↓              ↓             ↓         ↓
 index.html    Docker Build   Docker    Nginx    Public Access
 style.css     Push to ECR    Pull      Static   Port 80
 app.js                           Serve

🚀 Quick Start (Local)
# Clone & test locally
git clone <your-repo>
cd tictactoe
docker build -t tictactoe .
docker run -p 8080:80 tictactoe
# Visit http://localhost:8080

🛠️ AWS Infrastructure
Resource	Name	Region
ECR Repo	tictactoe	us-east-2
ECS Cluster	tictactoe-cluster	us-east-2
ECS Service	tictactoe-service	1 task
Task Family	tictactoe-task	Fargate

🔄 CI/CD Pipeline
Triggers: Push to main branch

Flow:

Build Docker image with index.html, style.css, app.js

Push to ECR (140352704906.dkr.ecr.us-east-2.amazonaws.com/tictactoe:latest)

Update ECS task definition with new image

Deploy → ECS rolls out new tasks (zero-downtime)

Workflow files:

.github/workflows/deploy-ecs.yml - Full CI/CD pipeline

📁 File Structure
text
tictactoe/
├── index.html          # Tic Tac Toe game
├── style.css           # Game styling
├── app.js             # Game logic
├── Dockerfile         # Nginx static server
├── nginx.conf         # Nginx config (port 80)
├── ecs-task-def.json  # ECS task definition template
└── .github/
    └── workflows/
        └── deploy-ecs.yml  # GitHub Actions CI/CD

🔧 Local Development

# Edit files, test locally
docker build -t tictactoe-local .
docker run -p 8080:80 tictactoe-local
# http://localhost:8080

🚀 Deploy Changes
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

🙌 Credits
Built with ❤️ using:

GitHub Actions - CI/CD

AWS ECS Fargate - Serverless containers

AWS ECR - Docker registry

Nginx Alpine - Static file server

## License
MIT © Cyber-Cross

