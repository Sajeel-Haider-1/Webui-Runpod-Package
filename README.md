# Webui-Runpod-Package

This repo contains the docker file for creating an ML package of Webui

## Table of Contents

- [Introduction](#introduction)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contact](#contact)

## Introduction

This project is designed to create a Runpod Package of Webui/Automatic1111.
WebUi/Automatic1111 is extended with a different model derived from CivitAi also it is extended with ControlNet, Reactor and OpenPose editor

## Technologies Used

- **Docker**:
- **Python**:

## Getting Started

### Prerequisites

- Python (v3 or later)
- Docker
- Google Cloud account

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Sajeel-Haider-1/Webui-Runpod-Package.git
   cd Webui-Runpod-Package
   ```
2. **Setup**:
   ```bash
   docker pull pytorch/pytorch
   docker build -t <image-name> .
   ```
3. **Push to Docker Hub**:
   ```bash
    docker push <dockerhub-account-name>/<image-name>:<tag>
   ```

### Usage

Pull the image in Runpod, create a serverless endpoint and use the template in which the docker image is attached.
Then the Runpod urls can be accessed.

### Contact

# For any inquiries, please contact sajeel@jetrr.com.
