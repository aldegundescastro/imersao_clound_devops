# Use an official Python runtime as a parent image
FROM python:3.13.4-alpine3.22 

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Expose the port that the FastAPI would run on
EXPOSE 8000

# O host 0.0.0.0 permite que a aplicação seja acessível externamente ao contêiner
# Define the command to run your application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]