# AutoGen Docker Code Executor with Environment Variables

This repository provides a detailed example of using AutoGen's DockerCommandLineCodeExecutor with Docker, specifically addressing the challenge of exposing environment variables to AI agents. I initially struggled to find a way for the code executor to access environment variables defined in a .env file. To solve this, the example combines a custom system message with the creation of a Docker image that includes the .env file, ensuring the variables are properly shared with the DockerCommandLineCodeExecutor.

## Features

- **Docker integration**: Uses Docker to execute code in a controlled environment.
- **Environment Variable Sharing**: Allows the Docker container to access environment variables from a `.env` file.

## Setup Instructions

### 1. Clone the Repository

```bash
git https://github.com/JKapostins/autogen_docker_envs.git
```

### 2. Set Up Python Virtual Environment

It is recommended to use a virtual environment to manage your dependencies. Here’s how you can set it up:

```bash
python -m venv pyautogen
source pyautogen/bin/activate  # On Windows use `.\pyautogen\Scripts\activate`
```

### 3. Install Python Requirements

Once the virtual environment is activated, install the necessary Python packages:

```bash
pip install -r requirements.txt
```
### 4. Setup the .env file

Copy the .env_example and rename it to `.env`
Be sure update the `OPENAI_API_KEY`
Add any additional enviornment variables that you want to share with the docker code executor.

### 5. Build the Docker Image

You need to build the Docker image that will be used by the `DockerCommandLineCodeExecutor`. This image will include the environment setup required by the app.

```bash
docker build -t autogen_env_example .
```

### 6. Run the Application

Finally, run the application using the following command:

```bash
python app.py
```

This will start the application and demonstrate how the Docker container can access environment variables defined in a `.env` file.

### 7. Execution and User Interaction
When you run the application, the code will request that you press 'Enter' every time the executor wants to execute code. Please be aware that during the first couple of executions, you may encounter errors, as the executor might fail initially. However, the executor will automatically make corrections by installing the required packages.

Once the code successfully executes, you will see a file called `./output/docker_envs.txt` containing all the environment variables that the Docker container has access to.


## Example Output
```sh
>>>>>>>> USING AUTO REPLY...
code_writer_agent (to code_executor_agent_docker):

Great! The script has successfully executed, and the environment variables have been written to `docker_envs.txt`. You should now find the file `docker_envs.txt` in your working directory with all the environment variables listed.

If you need any further assistance or have other queries, feel free to ask.

TERMINATE
```
