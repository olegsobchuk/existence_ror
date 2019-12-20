**Should be pre installed:**

- git
- docker
- docer-compose

Choose directory:

`cd my_dir`

Download application source code:

`git clone git@github.com:olegsobchuk/existence_ror.git`

Follow new directory:

`cd existence_ror`

Rename `.env.example` to `.env` and change keys for your own very secret keys.

Run `docer-compose` to build app:

`docker-compose -f "docker-compose.yml" up -d --build`

After build check if all containers are runing with `docker ps`

To stop containers use: `docker-compose -f "docker-compose.yml" down -d --build`

Afte build will be created directory with DB data `../app_store` don't remove it or you loose yor DB records.

To login use URL `/sessions/new` and use credentials:

Login: `admin`
Password: `12345678`

**After login change login and password to more secure**

Open browser and follow `http://localhost:3000` or `http://localhost:3000/sessions/new`
