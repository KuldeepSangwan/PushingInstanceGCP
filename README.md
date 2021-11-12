# How to push POstgresql and Jupyter Notebook into GCP instance
### Step 1 : Setup Postgres in a docker container in local
Pulling docker file of Postgres 
running the container 
creating a database
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/postgre1.JPG?raw=true)
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/postgre2.JPG?raw=true)

### Step 2 : Setup Jupyter in another docker container and uploading data to database and running some queries
DockerFile data:

      FROM ubuntu:latest

      RUN apt-get update && apt-get install -y python3 python3-pip

      RUN pip3 install jupyter

      RUN pip3 install numpy

      RUN pip3 install pandas

      RUN pip3 install matplotlib

      RUN pip3 install sqlalchemy

      RUN pip3 install postgres

      RUN useradd -ms /bin/bash jupyter

      USER jupyter

      WORKDIR /home/jupyter

      ENTRYPOINT ["jupyter","notebook","--ip=*"]

cmd code:
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/notebook1.JPG?raw=true)


### Step 3 : Writing some connection code and inserting some data in Database and running some query
check Sample Queries.ipynb file

### Step 4 : Pushing the jupyter Notebook Docker file in GCP
I have created an API in GCP for the jupyter Notebook

first i have build the container from the docker file then i deployed it using following command
    gcloud builds submit --tag gcr.io/aganithaproject-331503/aganithaproject
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/GCPDockerBuild.JPG?raw=true)
    gcloud run deploy --port 8888 --image gcr.io/aganithaproject-331503/aganithaproject
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/GCPDockerDeploy.JPG?raw=true)

we can access it from - https://aganithaproject-2pdrmgujiq-km.a.run.app/
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/GCPDockernotebook.JPG?raw=true)

### Step 5 : Deploy the Postgresql server on GCP

So in this step i had few erros.I tried to deploy the Docker image of Postgresql in Compute engine VM but i was not able to connect and i also try to create Postgresql server instance in GCP Database but that also i was not able to connect
Just pasting the screenshot of Postgresql server instance
![alt text](https://github.com/KuldeepSangwan/aganithaiminiproject/blob/main/postgreVM.JPG?raw=true)


              
