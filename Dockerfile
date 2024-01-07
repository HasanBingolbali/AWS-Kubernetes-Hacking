# Use an official Go runtime as a parent image
FROM golang:1.21

# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files to download the dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the source code
COPY . .

RUN go build -o eks-hacking ./main.go

CMD ["./eks-hacking"]

#docker buildx build --platform linux/amd64 -t hasannaber123/eks-hacking .
#docker push hasannaber123/eks-hacking